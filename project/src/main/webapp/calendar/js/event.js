var draggedEventIsAllDay;
var activeInactiveWeekends = true;

	function getDisplayEventDate(event) {
		console.log("==== getDisplayEventDate");
		console.log(event);

	    var startTimeEventInfo = moment(event.start).format('HH:mm');
	    var endTimeEventInfo = moment(event.end).format('HH:mm');
	    var displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	  return displayEventDate;
	}


	function calDateWhenResize(event) {
		console.log("==== calDateWhenResize");
		console.log(event);
		
	  var newDates = {
	    startDate: '',
	    endDate: ''
	  };

	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');

	  return newDates;
	}

	function calDateWhenDragnDrop(event) {
		console.log("==== calDateWhenDragnDrop");
		console.log(event);
	  // 드랍시 수정된 날짜반영
	  var newDates = {
	    startDate: '',
	    endDate: ''
	  }

	  // 날짜 & 시간이 모두 같은 경우
	  if(!event.end) {
	    event.end = event.start;
	  }

	  
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  

	  return newDates;
	}


	var calendar = $('#calendar').fullCalendar({

	  eventRender: function (event, element, view) {
		  console.log("시작");
		  console.log(event);
	    // 일정에 hover시 요약
	    element.popover({
	      title: $('<div />', {
	        class: 'popoverTitleCalendar',
	        text: event.title
	      }).css({
	        'background': event.backgroundColor,
	        'color': event.textColor
	      }),
	      content: $('<div />', {
	          class: 'popoverInfoCalendar'
	        })
//	        .append('<p><strong>등록자:</strong> ' + event.username + '</p>')
	        .append('<p><strong>회의제목:</strong> ' + event.title + '</p>')
	        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
	        .append('<div class="popoverDescCalendar"><strong>회의내용:</strong> ' + event.description + '</div>'),
	      delay: {
	        show: "800",
	        hide: "50"
	      },
	      trigger: 'hover',
	      placement: 'top',
	      html: true,
	      container: 'body'
	    });

	    return;

	  },

	  header: {
	    left: 'today, prevYear, nextYear, viewWeekends',
	    center: 'prev, title, next',
	    right: 'month'
	  },
	  contentHeight:400,
	  views: {
	    month: {
	      columnFormat: 'dddd'
	    }
	  },

	  /***********************************************************************
		 * 일정 받아옴 **************
		 */
	  events: function (start, end, timezone, callback) {
		  var pno = {pno : $("#pno").val()};
		  console.log(pno);
	    /*$.ajax({
	      type: "post",
	      url: "/scrum/ajax/getschedule.do",
	      data: pno,
	      success: function (response) {
	    	  console.log("???????");
	    	  var res = JSON.parse(response);
	    	  console.log(res);
	        var fixedDate = res.map(function (array) {
	        	console.log(array);
	          if (array.allDay && array.start !== array.end) {
	            // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
	            array.end = moment(array.end).add(1, 'days');
	          }
	          return array;
	        })
	        callback(fixedDate);
	      }
	    });*/
	  },

	  eventAfterAllRender: function (view) {
	    if (view.name == "month") {
	      $(".fc-content").css('height', 'auto');
	    }
	  },

	  // 일정 리사이즈
	  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
	    $('.popover.fade.top').remove();

	    /**
		 * 리사이즈시 수정된 날짜반영 하루를 빼야 정상적으로 반영됨.
		 */
	    var newDates = calDateWhenResize(event);

	    // 리사이즈한 일정 업데이트
	    $.ajax({
	      type: "get",
	      url: "",
	      data: {
	        // id: event._id,
	        // ....
	      },
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });

	  },

	  eventDragStart: function (event, jsEvent, ui, view) {
	    draggedEventIsAllDay = event.allDay;
	  },

	  // 일정 드래그앤드롭
	  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
		  console.log($("#auth").val());
		 /* if($("#auth").val() == 'Master'){*/
	    $('.popover.fade.top').remove();

	    // 주,일 view일때 종일 <-> 시간 변경불가
	    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
	      if (draggedEventIsAllDay !== event.allDay) {
	        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
	        location.reload();
	        return false;
	      }
	    }

	    
	    // 드랍시 수정된 날짜반영
	    var newDates = calDateWhenDragnDrop(event);
	    var write_data = {
	    		pno : $("#pno").val(),
	    		cno : event._id,
	    		start : newDates.startDate,
	    		end : newDates.endDate
	    }
	    // 드롭한 일정 업데이트
	    $.ajax({
	      type: "post",
	      url: "/scrum/ajax/updateDate.do",
	      data: write_data,
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });
	   /* }else{
	    	alert("해당 권한이 없습니다.");
	    }*/
	  },

	  select: function (startDate, endDate, jsEvent, view) {

	    $(".fc-body").unbind('click');
	    $(".fc-body").on('click', 'td', function (e) {
	    	/*if($("#auth").val() == 'Master'){*/ // 클릭 이벤트
	      $("#contextMenu")
	        .addClass("contextOpened")
	        .css({
	          display: "block",
	          left: e.pageX,
	          top: e.pageY
	        });
	    	/*}*/
	      return false;
	    });

	    var today = moment();

	    if (view.name == "month") {
	      startDate.set({
	        hours: today.hours(),
	        minute: today.minutes()
	      });
	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).subtract(1, 'days');

	      endDate.set({
	        hours: today.hours() + 1,
	        minute: today.minutes()
	      });
	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    } else {
	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    }

	    // 날짜 클릭시 카테고리 선택메뉴
	    var $contextMenu = $("#contextMenu");
	    $contextMenu.on("click", "a", function (e) {
	      e.preventDefault();

	      // 닫기 버튼이 아닐때
	      if ($(this).data().role !== 'close') {
	        newEvent(startDate, endDate, $(this).html());
	      }

	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });

	    $('body').on('click', function () {
	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });

	  },

	  // 이벤트 클릭시 수정이벤트
	  eventClick: function (event, jsEvent, view) {
	    editEvent(event);
	  },

	  locale: 'ko',
	  timezone: "local",
	  nextDayThreshold: "09:00:00",
	  allDaySlot: true,
	  displayEventTime: true,
	  displayEventEnd: true,
	  firstDay: 0, // 월요일이 먼저 오게 하려면 1
	  weekNumbers: false,
	  selectable: true,
	  weekNumberCalculation: "ISO",
	  eventLimit: true,
	  views: {
	    month: {
	      eventLimit: 12
	    }
	  },
	  eventLimitClick: 'week', // popover
	  navLinks: true,
	  defaultDate: moment(), // 오늘
	  timeFormat: 'HH:mm',
	  defaultTimedEventDuration: '01:00:00',
	  editable: true,
	  minTime: '00:00:00',
	  maxTime: '24:00:00',
	  slotLabelFormat: 'HH:mm',
	  weekends: true,
	  nowIndicator: true,
	  dayPopoverFormat: 'MM/DD dddd',
	  longPressDelay: 0,
	  eventLongPressDelay: 0,
	  selectLongPressDelay: 0
	});
	
	
	/**********************************************************************************************************************************/
	
	var eventModal = $('#eventModal');
	var modalTitle = $('.modal-title');
	var subject = $('#subject');
	var content = $('#content');
	var start = $('#start');
	var end = $('#end');
	var color = $('#color');
	var pno = $('#pno');
	var login = $('#login');
	var auth = $("#auth");

	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


	/***************************************************************************
	 * 새로운 일정 생성 **************
	 */
	
	var newEvent = function (s, e, eventType) {
		console.log(s);
		console.log(e);
		console.log(eventType);
	    $("#contextMenu").hide(); // 메뉴 숨김

	    modalTitle.html('SCRUM 회의');
	    subject.val('');
	    start.val(s);
	    end.val(e);
	    content.val('');
	    
	    addBtnContainer.show();
	    modifyBtnContainer.hide();
	    eventModal.modal('show');

	    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
	    var eventId = 1 + Math.floor(Math.random() * 1000);
	    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

	    // 새로운 일정 저장버튼 클릭
	    $('#save-event').unbind();
	    $('#save-event').on('click', function () {
	    	console.log(pno.val());
			console.log(login.val());
	    	
	        var eventData = {
	            _id: event.Id,
	            title: subject.val(),
	            start: start.val(),
	            end: end.val(),
	            description: content.val(),
	            username: login.val(),
	            backgroundColor: color.val(),
	            textColor: '#ffffff',
	            allDay: false
	        };

	        if (eventData.start > eventData.end) {
	            alert('끝나는 날짜가 앞설 수 없습니다.');
	            return false;
	        }

	        if (eventData.title === '') {
	            alert('일정명은 필수입니다.');
	            return false;
	        }

	        var realEndDay;
	        
	        var data = {
	        		pno: pno.val(),
	        		subject: subject.val(),
	        		start: start.val(),
	        		end: end.val(),
	        		content: content.val(),
	        		color: color.val(),
	        };
	        
	        console.log(data);
	        
	        // 새로운 일정 저장
	        $.ajax({
	            type: "post",
	            url: "/scrum/ajax/schedule.do",
	            data: data,
	            success: function (data) {
	            	console.log("ajax 성공");
	            	 $("#calendar").fullCalendar('renderEvent', eventData, true);
	     	        eventModal.find('input, textarea').val('');
	     	        eventModal.modal('hide');
	                // DB연동시 중복이벤트 방지를 위한
	                // $('#calendar').fullCalendar('removeEvents');
	                // $('#calendar').fullCalendar('refetchEvents');
	            }, 
	            error : function(e) {
	            	alert("서버오류: " + e.status);
				}
	        });
	    });
	};
	
	
	
	/***************************************************************************
	 * 일정 편집 **************
	 */
	var editEvent = function (event, element, view) {

	    $('#deleteEvent').data('id', event._id); // 클릭한 이벤트 ID
	    
	    $('.popover.fade.top').remove();
	    $(element).popover("hide");


	    if (event.end === null) {
	        event.end = event.start;
	    }

	    if (event.allDay === true && event.end !== event.start) {
	        end.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
	    } else {
	        end.val(event.end.format('YYYY-MM-DD HH:mm'));
	    }

	    modalTitle.html('일정 수정');
	    subject.val(event.title);
	    start.val(event.start.format('YYYY-MM-DD HH:mm'));
	    content.val(event.description);
	    color.val(event.backgroundColor).css('color', event.backgroundColor);

	    
	    addBtnContainer.hide();
	    modifyBtnContainer.show();
	    eventModal.modal('show');

	    // 업데이트 버튼 클릭시
	    $('#updateEvent').unbind();
	    $('#updateEvent').on('click', function () {

	        if (start.val() > end.val()) {
	            alert('끝나는 날짜가 앞설 수 없습니다.');
	            return false;
	        }

	        if (subject.val() === '') {
	            alert('일정명은 필수입니다.')
	            return false;
	        }

	        var statusAllDay;
	        var startDate;
	        var endDate;
	        var displayDate;

	       
	            statusAllDay = false;
	            startDate = start.val();
	            endDate = end.val();
	            displayDate = endDate;
	        

	        eventModal.modal('hide');

	        event.allDay = statusAllDay;
	        event.title = subject.val();
	        event.start = startDate;
	        event.end = displayDate;
	        event.backgroundColor = color.val();
	        event.description = content.val();
	        
	        
	        var data = {
	        		cno: event._id,
	        		pno: pno.val(),
	        		subject: event.title,
	        		start: event.start,
	        		end: event.end,
	        		content: event.description,
	        		color: event.backgroundColor,
	        };
	        
	        console.log(data);
	        

	        // 일정 업데이트
	        $.ajax({
	            type: "post",
	            url: "/scrum/ajax/updateschedule.do",
	            data: data,
	            success: function (response) {
	            	console.log("ajax 성공");
	                alert('수정되었습니다.');
	                $("#calendar").fullCalendar('updateEvent', event);
	            }, 
	            error : function(e) {
	            	alert("서버오류: " + e.status);
				}
	        });

	    });
	};

	// 삭제버튼
	$('#deleteEvent').on('click', function () {
	    
		console.log("삭제");
//	    $('#deleteEvent').unbind();
		var data = {
        		cno: $(this).data('id'),
        		pno: pno.val()
        };
        console.log(data);
		
		
		
		

	    // 삭제시
	    $.ajax({
	        type: "post",
	        url: "/scrum/ajax/deleteschedule.do",
	        data: data,
	        success: function (response) {
	            alert('삭제되었습니다.');
	            $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
	            eventModal.modal('hide');
	        }
	    });

	});
	
	// SELECT 색 변경
	$('#edit-color').change(function () {
	    $(this).css('color', $(this).val());
	});

	// 필터
	$('.filter').on('change', function () {
	    $('#calendar').fullCalendar('rerenderEvents');
	});

	$("#type_filter").select2({
	    placeholder: "선택..",
	    allowClear: true
	});

	// datetimepicker
	$("#edit-start, #edit-end").datetimepicker({
	    format: 'YYYY-MM-DD HH:mm'
	});