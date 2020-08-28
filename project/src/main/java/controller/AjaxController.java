package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import logic.Board;
import logic.Coworking;
import logic.DevService;
import logic.Goodorbad;
import logic.Hashtag;
import logic.Message;
import logic.Project;
import logic.Reply;
import logic.Report;
import logic.Subscribe;
import logic.TIL;
import logic.Tag;
import logic.User;
import logic.UserFile;

@RestController // @ResponseBody: View 없이 직접 데이터를 클라이언트에 전송
@RequestMapping("ajax")
public class AjaxController {

	@Autowired
	private DevService service;

	@RequestMapping(value = "saveprofile", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String saveprofile(MultipartFile[] files, HttpServletRequest request, HttpSession session) {
		System.out.println("ajax");
		System.out.println(files);
		System.out.println(files[0]);
		User user = (User) session.getAttribute("loginUser");
		System.out.println(user);
		for (MultipartFile file : files) {
			System.out.println(file.getOriginalFilename());
			service.uploadFileCreate(file, request, "profile/", user);
			UserFile f = new UserFile();
			f.setNo(1);
			f.setWno(user.getUno());
			f.setFno(1);
			f.setName(user.getName());
			f.setFilename(user.getName()+".jpg");
			f.setFileurl("profile/");
			service.update_file(f);
		}
		return null;
	}

	@RequestMapping(value = "hashtag", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String hashtag(HttpServletRequest request) {
		String[] arr = request.getParameterValues("hash");
		System.out.println(Arrays.toString(arr));
		Hashtag hash = new Hashtag();
		int no = Integer.parseInt(request.getParameter("no"));
		hash.setNo(no);
		if(no == 6) hash.setWno(service.getmaxcono() + 1);
		else hash.setWno(service.getmaxbno(no) + 1);
		if(arr != null) {
		for (int i = 0; i < arr.length; i++) {
			hash.setHno(i+1);
			hash.setHashname(arr[i]);
			service.insertHashtag(hash);
		}
		}
		return null;
	}

	@RequestMapping(value = "searchworking", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String searchworking(HttpServletRequest request) throws ParseException {
		String searchinput = request.getParameter("searchinput");
		String searchtype = request.getParameter("searchtype");
		String searchsort = request.getParameter("searchsort");
		int category = Integer.parseInt(request.getParameter("category"));
		int num = Integer.parseInt(request.getParameter("num"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		System.out.println(request.getParameter("searchinput"));
		System.out.println(request.getParameter("searchtype"));
		if (searchinput.trim().equals("")) {
			searchinput = null;
			searchtype = null;
		}
		List<Coworking> list = service.getWorkinglist(searchtype, searchinput, searchsort, category, num, limit);
		List<Hashtag> hash = service.getHashtaglist(6);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getGno(), i);
		}
		for (Hashtag h : hash) {
			if (map.containsKey(h.getWno())) {
				list.get(map.get(h.getWno())).addHashlist(h.getHashname());
			}

		}
		StringBuilder sb = new StringBuilder("[");
		int i = 0;
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(now);
		Date date = sf.parse(today);
		for (Coworking co : list) {
			long diff = (co.getDeadline().getTime() - date.getTime()) / (1000*60*60*24);
			sb.append("{\"gno\":\"" + co.getGno() + "\",");
			sb.append("\"name\":\"" + co.getName() + "\",");
			sb.append("\"title\":\"" + co.getTitle() + "\",");
			sb.append("\"category\":\"" + co.getCategory() + "\",");
			sb.append("\"content\":\"" + co.getContent().replace('\n', ' ').replace('\r', ' ') + "\",");
			sb.append("\"maxnum\":\"" + co.getMaxnum() + "\",");
			sb.append("\"grade\":\"" + co.getGrade() + "\",");
			sb.append("\"startdate\":\"" + sf.format(co.getStartdate()) + "\",");
			sb.append("\"enddate\":\"" + sf.format(co.getEnddate()) + "\",");
			sb.append("\"diff\":\"" + diff + "\",");
			sb.append("\"regdate\":\"" + sf.format(co.getRegdate()) + "\",");			
			sb.append("\"hashlist\":[");
			for (int j = 0; j < co.getHashlist().size(); j++) {
				sb.append("\"" + co.getHashlist().get(j) + "\"");
				if (j < co.getHashlist().size() - 1)
					sb.append(",");
			}
			sb.append("]}");
			i++;
			if (i < list.size())
				sb.append(",");
		}
		sb.append("]");
		System.out.println(sb);
		return sb.toString();
	}
	
	@RequestMapping(value = "searchcommunity", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String searchcommunity(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		int num = Integer.parseInt(request.getParameter("num"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		List<Board> list = service.getCommunitylist(no, num, limit);
		System.out.println(list);
		StringBuilder sb = new StringBuilder("[");
		int i = 0;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		for (Board b : list) {
			sb.append("{\"no\":\"" + b.getNo() + "\",");
			sb.append("\"bno\":\"" + b.getBno() + "\",");
			sb.append("\"name\":\"" + b.getName() + "\",");
			sb.append("\"title\":\"" + b.getTitle() + "\",");
			sb.append("\"regdate\":\"" + sf.format(b.getRegdate()) + "\",");
			sb.append("\"point\":\"" +b.getPoint() + "\"}");
			i++;
			if (i < list.size())
				sb.append(",");
		}
		sb.append("]");
		System.out.println(sb);
		return sb.toString();
	}
	
	@RequestMapping(value = "commentdelete", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentdelete(HttpServletRequest request) {
		System.out.println("ajax");
		Reply reply = new Reply();
		reply.setNo(Integer.parseInt(request.getParameter("no")));
		reply.setBno(Integer.parseInt(request.getParameter("bno")));
		reply.setRno(Integer.parseInt(request.getParameter("rno")));
		System.out.println(reply);
		service.replyDelete(reply);

		return null;
	}

	@PostMapping(value = "findid", produces = "text/plain; charset=UTF-8")
	public String findid(HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String id = service.findId(name, email);
		if (id != null) {
			return "회원님의 아이디는 " + id + "입니다.";
		} else {
			return "해당 아이디가 존재하지 않습니다.";
		}
	}

	@PostMapping(value = "findpw", produces = "text/plain; charset=UTF-8")
	public String findpw(HttpServletRequest request) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = service.findPw(id, name, email);
		if (pw != null) {
			return "회원님의 비밀번호는 " + pw + "입니다.";
		} else {
			return "입력하신 정보가 잘못되었습니다.";
		}
	}

	@PostMapping(value = "changepw", produces = "text/plain; charset=UTF-8")
	public String changepw(HttpServletRequest request, HttpSession session) {
		String currentpw = request.getParameter("currentpw");
		String newpw = request.getParameter("newpw");
		String newpw2 = request.getParameter("newpw2");

		String id = request.getParameter("id");

		System.out.println("" + currentpw + newpw + id);

		User DBUser = service.getUser(id);

		if (!currentpw.equals(DBUser.getPw())) {
			return "현재 비밀번호를 확인하세요";
		} else if (newpw.equals(DBUser.getPw())) {
			return "변경 비밀번호와 현재 비밀번호가 같습니다.";
		} else if (newpw.length() < 4) {
			return "비밀번호는 4자 이상 입력하세요";
		} else if (!newpw.equals(newpw2)) {
			return "입력하신 정보에 오류가 있습니다.";
		}
			service.changepw(id, newpw);
			DBUser.setPw(newpw);
			session.setAttribute("loginUser", DBUser);
			return "비밀번호가 변경되었습니다.";
		
	}

	@PostMapping(value = "sendMessage", produces = "text/plain; charset=UTF-8")
	public String sendMessage(HttpServletRequest request) {
		try {
			String me_from = request.getParameter("me_from");
			String me_to = request.getParameter("me_to");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int meno = service.maxmno() + 1;

			Message msg = new Message();
			msg.setMeno(meno);
			msg.setMe_from(me_from);
			msg.setMe_to(me_to);
			msg.setTitle(title);
			msg.setContent(content);

			service.messageInsert(msg);
			return "쪽지를 발송했습니다";
		} catch (Exception e) {
			return "오류가 발생했습니다";
		}
	}

	@PostMapping(value = "report", produces = "text/plain; charset=UTF-8")
	public String report(HttpServletRequest request) {
		try {
			String content = request.getParameter(("content"));
			String reportedName = request.getParameter("reportedName");
			int no = Integer.parseInt(request.getParameter("no"));
			int wno = service.getmaxwno_Report(no) + 1;
			int reno = service.getmaxreno_Report() + 1;

			Report report = new Report();
			report.setNo(no);
			report.setWno(wno);
			report.setReno(reno);
			report.setName(reportedName);
			report.setContent(content);

			System.out.println(report);
			service.reportInsert(report);
			return "신고가 완료되었습니다";
		} catch (Exception e) {
			return "오류가 발생했습니다";
		}

	}

	@RequestMapping(value = "commentinsert", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentinsert(HttpServletRequest request) {
		System.out.println("ajax");
		Reply reply = new Reply();
		reply.setNo(Integer.parseInt(request.getParameter("no")));
		reply.setBno(Integer.parseInt(request.getParameter("bno")));
		reply.setContent(request.getParameter("content"));
		reply.setName(request.getParameter("name"));
		System.out.println(reply);

		service.replyInsert(reply);
		return null;
	}

	@RequestMapping(value = "commentList", produces = "text/plain; charset=UTF-8", method = RequestMethod.GET)
	public String commentList(HttpServletRequest request) {
		System.out.println("ajax");
		Reply reply = new Reply();
		reply.setNo(Integer.parseInt(request.getParameter("no")));
		reply.setBno(Integer.parseInt(request.getParameter("bno")));
		List<Reply> replylist = service.replyList(reply);
		System.out.println(replylist);
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int i = 0;
		for (Reply r : replylist) {
			sb.append("{\"no\":\"" + r.getNo() + "\",");
			sb.append("\"rno\":\"" + r.getRno() + "\",");
			sb.append("\"bno\":\"" + r.getBno() + "\",");
			sb.append("\"name\":\"" + r.getName() + "\",");
			sb.append("\"content\":\"" + r.getContent() + "\",");
			sb.append("\"regdate\":\"" + r.getRegdate() + "\"}");
			i++;
			if (i < replylist.size())
				sb.append(",");
		}
		sb.append("]");
		System.out.println(sb);
		return sb.toString();
	}
	
	@RequestMapping(value="portfolioSave", produces = "text/plain; charset=UTF-8")
	public String portfolioSave (HttpServletRequest request, HttpSession session) {
		int userno = ((User)session.getAttribute("loginUser")).getUno();
		String username = ((User)session.getAttribute("loginUser")).getName();
		
		String[] pTags = request.getParameterValues("pTags");
		String[] sTags = request.getParameterValues("sTags");
		String giturl = request.getParameter("giturl");
		String giturlable = request.getParameter("giturlable");
		String[] projectablePronos = request.getParameterValues("projectablepronos");
		int positionNo = 7;
		int skillsNo = 8;
		
		//태그 클리어 하고 추가. --> 입력안 되었을 시 에러 발생 상태
		service.positionTagsClear(positionNo, userno);
		service.skillsTagsClear(skillsNo, userno);

		Tag tag = new Tag();
		tag.setWno(userno);
		
		if(pTags != null) {
			tag.setNo(positionNo);
			for(String t : pTags) {
				tag.setTno(service.getMaxTno()+1);
				tag.setTag(t);
				service.insertTag(tag);
			}
		}
			if(sTags != null) {
				tag.setNo(skillsNo);
				for(String t : sTags) {
					tag.setTno(service.getMaxTno()+1);
					tag.setTag(t);
					service.insertTag(tag);
				}
		}
		
		//깃허브 주소랑 공개 여부
		User dbUser = (User)session.getAttribute("loginUser");
		dbUser.setGiturl(giturl);
		if(giturlable.equals("false"))
			dbUser.setGiturlable(false);
		else 
			dbUser.setGiturlable(true);

		service.giturlUpdate(dbUser);
		
		//프로젝트 공개여부 변경
		service.clearProjectable(username);
		if(projectablePronos != null) {
			for(String prono : projectablePronos) {
				service.updateProjectAble(username,Integer.parseInt(prono));
			}
		}
		
		return null;
	}
	
	@RequestMapping(value="addProject", produces = "text/plain; charset=UTF-8")
	public String addProject (HttpServletRequest request, HttpSession session) throws ParseException {
		
		int userno = ((User)session.getAttribute("loginUser")).getUno();
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		int numbers = Integer.parseInt(request.getParameter("numbers"));
		String description = request.getParameter("description");
		String repository = request.getParameter("repository");
			String startStr = request.getParameter("start");
			String endStr = request.getParameter("end");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date start = formatter.parse(startStr);
		Date end = formatter.parse(endStr);
		int prono = service.getMaxProno(name) + 1;
		/*
		Tag 테이블
			no : 2
			wno : username
			tno : tno
			prono : prono
	 */
	String[] usedTags = request.getParameterValues("usedTags");
	Tag tag = new Tag();
	tag.setNo(2);
	tag.setWno(userno);
	tag.setProno(prono);
	if (usedTags != null) {
		for (String t : usedTags) {
			tag.setTag(t);
			tag.setTno(service.getMaxTno()+1);
			service.insertTag(tag);
		}
	}

		Project newproject = new Project();
		newproject.setName(name);
		newproject.setSubject(subject);
		newproject.setNum(numbers);
		newproject.setDescription(description);
		newproject.setRepository(repository);
		newproject.setStart(start);
		newproject.setEnd(end);
		newproject.setProno(prono);
		service.addProject(newproject);
		String result = 
				"{\"subject\":\"" + subject + "\",\"term\":\"" + startStr + "~" + endStr + 
				"\",\"numbers\":\"" + numbers + "\",\"prono\":\""+prono+"\"}";
		
		return result;
	}
	
	@PostMapping(value="warning", produces="text/plain; charset=UTF-8")
	public String warning (HttpServletRequest request, HttpSession session) {
		String name = request.getParameter("targetname");
		int addedAlertnum = service.getAlertNum(name) + 1;
		service.warnUser(addedAlertnum, name);
		return null;
	}
	
	@RequestMapping(value="deleteProject", produces = "text/plain; charset=UTF-8")
	public String deleteProject (HttpServletRequest request, HttpSession session) {
		String username = request.getParameter("name");
		String[] projectslist = request.getParameterValues("projectslist");
		if(projectslist != null) {
			for(String prono : projectslist) {
				service.deleteProject(username,Integer.parseInt(prono));
			}
		}
		return null;
	}
	
	@PostMapping(value = "subinsert", produces="text/plain; charset=UTF-8")
	public String subinsert(HttpServletRequest request, HttpSession session) {
		Subscribe sub = new Subscribe(); //로직 호출
		
		String scrapped = request.getParameter("name"); 
		User scrapper = (User)session.getAttribute("loginUser");
		
		
		sub.setScrapped(scrapped);
		sub.setScrapper(scrapper.getName());
		
		
		
		service.subinsert(sub);
		
		return null;
	}
	
	@PostMapping(value = "subdelete", produces="text/plain; charset=UTF-8")
	public String subdelete(HttpServletRequest request, HttpSession session) {
		Subscribe sub = new Subscribe(); //로직 호출
		
		String scrapped = request.getParameter("name"); 
		User scrapper = (User)session.getAttribute("loginUser");
		System.out.println(scrapper);
		System.out.println(scrapped);
		
		sub.setScrapped(scrapped);
		sub.setScrapper(scrapper.getName());
		
		
		
		service.subdelete(sub);
		
		return null;
	}
	
	@PostMapping(value = "likeinsert", produces="text/plain; charset=UTF-8")
	public String likeinsert(HttpServletRequest request, HttpSession session) {
		Goodorbad gob= new Goodorbad();
		gob.setNo(3);
		int wno = Integer.parseInt(request.getParameter("wno"));
		gob.setWno(wno);
		gob.setName(((User)session.getAttribute("loginUser")).getName());
		gob.setGno(service.getmaxgno(3, wno)+1);
		System.out.println(gob);
		service.likeinsert(gob);
		return null;
	}

	@PostMapping(value = "likedelete", produces="text/plain; charset=UTF-8")
	public String likedelete(HttpServletRequest request, HttpSession session) {
		int wno = Integer.parseInt(request.getParameter("wno"));
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		service.likedelete(no, wno, name);

		return null;
	}
	
	@RequestMapping(value = "searchtil", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String searchtil(HttpServletRequest request) {
		String searchinput = request.getParameter("searchinput");
		String searchtype = request.getParameter("searchtype");
		int searchsort = Integer.parseInt(request.getParameter("searchsort"));
		int num = Integer.parseInt(request.getParameter("num"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		if (searchinput.trim().equals("")) {
			searchinput = null;
			searchtype = null;
		}
		List<TIL> list = service.getTillist(searchinput, searchtype, searchsort, num, limit);
		List<Hashtag> hash = service.getHashtaglist(3);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getBno(), i);
		}
		for(Hashtag h : hash) {
			if(map.containsKey(h.getWno())) {
				list.get(map.get(h.getWno())).addHashlist(h.getHashname());
			}
			
		}
		StringBuilder sb = new StringBuilder("[");
		int i = 0;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		for (TIL til : list) {
			sb.append("{\"no\":\"" + til.getNo() + "\",");
			sb.append("\"bno\":\"" + til.getBno() + "\",");
			sb.append("\"title\":\"" + til.getTitle() + "\",");
			sb.append("\"name\":\"" + til.getName() + "\",");
			sb.append("\"regdate\":\"" + sf.format(til.getRegdate()) + "\",");
			sb.append("\"open\":\"" + (til.isOpen() ? 1 : 0) + "\",");
			sb.append("\"point\":\"" + til.getPoint() + "\",");
			sb.append("\"hashlist\":[");
			for (int j = 0; j < til.getHashlist().size(); j++) {
				sb.append("\"" + til.getHashlist().get(j) + "\"");
				if (j < til.getHashlist().size() - 1)
					sb.append(",");
			}
			sb.append("]}");
			i++;
			if (i < list.size())
				sb.append(",");
		}
		sb.append("]");
		return sb.toString();
	}
	
	@PostMapping(value = "likeEvent", produces="text/plain; charset=UTF-8")
	public String likeEvent(HttpServletRequest request, HttpSession session) {
		int likechk = Integer.parseInt(request.getParameter("likechk"));
		int no = Integer.parseInt(request.getParameter("no"));
		int wno = Integer.parseInt(request.getParameter("wno"));
		String name = ((User)session.getAttribute("loginUser")).getName();
		if (likechk == 1) { // insert
			Goodorbad g = new Goodorbad();
			g.setNo(no);
			g.setWno(wno);
			g.setGno(service.getmaxlike(no, wno) + 1);
			g.setName(name);
			g.setPoint(1);
			service.insert_like(g);
		}else { // delete
			service.delete_like(no, wno, name);
		}
		return null;
	}
	
	@RequestMapping(value = "commentupdate", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String commentupdate(HttpServletRequest request) {
		System.out.println("ajax");
		Reply reply = new Reply();
		reply.setNo(Integer.parseInt(request.getParameter("no")));
		reply.setBno(Integer.parseInt(request.getParameter("bno")));
		reply.setRno(Integer.parseInt(request.getParameter("rno")));
		reply.setContent(request.getParameter("content"));
		service.replyUpdate(reply);
		
		
		return null;
	}
	
	@PostMapping(value="deleteMessage", produces="text/plain; charset=UTF-8")
	public String deleteMessage(HttpServletRequest request, HttpSession session) {
		String[] menolist = request.getParameterValues("menolist");
		for(String m : menolist) {
			int meno = Integer.parseInt(m);
			service.deleteMessage(meno);
		}
		return null;
	}
	@PostMapping(value="banUser", produces="text/plain; charset=UTF-8")
	public String banUser(HttpServletRequest request, HttpSession session) {
		String name = request.getParameter("targetuser");
		service.banUser(name);
		return null;
	}
}
