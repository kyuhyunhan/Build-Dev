# 구디아카데미 팀 프로젝트 Build-Dev
> 1. 프로젝트 소개
> 1. 개발 기본 정보
> 1. 담당 개발 업무

<br>

## 1. 프로젝트 소개
> 개발자를 위한 자기계발 사이트
> 개발자들의 포트폴리오 관리 및 다양한 소통 공간을 제공하는 플랫폼

##### :star: &nbsp;&nbsp;포트폴리오 관리 : 자신의 프로젝트와 개발 관련 정보를 관리한다.
##### :star: &nbsp;&nbsp;TIL(Today I Learned) : 스스로 학습한 내용을 기록하고 공유한다.
##### :star: &nbsp;&nbsp;커뮤니티 : 자유게시판, Q&A 게시판을 통해 다른 유저들과 소통한다.
##### :star: &nbsp;&nbsp;Co-Working : 개발자들이 함께 모여 프로젝트/스터디/공모전을 계획하고 준비할 수 있도록 돕는 플랫폼이다.

<br>

## 2. 개발 기본 정보
##### :calendar: &nbsp;&nbsp;20.08.03&nbsp;&nbsp;~&nbsp;&nbsp;20.08.28
##### :busts_in_silhouette: &nbsp;&nbsp;5명
##### :wrench: &nbsp;&nbsp;Tools : Eclipse, HeidiSQL(mariaDB)
##### :pencil2: &nbsp;&nbsp;Languages : JAVA, Javascript(jQuery)
##### :nut_and_bolt: &nbsp;&nbsp;Frameworks : Spring, MyBatis, Bootstrap

<br>


## 3. 담당 개발 업무  
### :couple: 회원 관리 및 공통 기능
#### :one: &nbsp;&nbsp;회원 가입 화면 및 유효성 검사<br>
Spring Framework의 `@Vaild` Annotation을 이용한 유효성 검사
#### :two: &nbsp;&nbsp;로그인, 아이디 찾기 및 비밀번호 찾기<br>
#### :three: &nbsp;&nbsp;로그아웃<br>
#### :four: &nbsp;&nbsp;회원 정보 수정 및 탈퇴, 비밀번호 변경하기<br>
#### :five: &nbsp;&nbsp;쪽지 보내기 및 쪽지 보관함(받은 쪽지함/보낸쪽지함), 쪽지 삭제

<br>

### :hammer: 관리자 페이지
#### :one:&nbsp;&nbsp; 신고 관리 및 회원 관리<br>
#### :two:&nbsp;&nbsp; 신고된 회원에게 경고메세지 발송. 경고받은 회원은 경고 횟수 카운트
#### :three:&nbsp;&nbsp; 회원 강제 탈퇴

<br>

### :massage: 프로필 모달
> 회원 이름 클릭 시 모달 팝업. Sitemesh를 이용하여 Layout.jsp를 통해 모든 웹 페이지에 적용
#### :one:&nbsp;&nbsp; 포트폴리오 링크, my TIL 링크, 쪽지 보내기, 신고하기<br>
#### :two:&nbsp;&nbsp; 쪽지 보내기와 신고하기는 추가 모달 통해 사용

<br>

### :pencil: My Portfolio 작성 / 수정 <!-- 왜 [저장하기] 버튼을 AJAX 방식으로 설정했지? -->
#### :one:&nbsp;&nbsp; 자신의 Position, Skill 관련 정보를 `Tag` 방식으로 입력 및 삭제<br>
#### :two:&nbsp;&nbsp; Github url 추가, 공개/비공개 설정<br>
#### :three:&nbsp;&nbsp; 프로젝트 추가/삭제, 공개 여부 설정 <br>
`AJAX`방식으로 Controller에서 `JSON` 형태로 데이터를 전달받아 page reload없이 프로젝트 리스트를 추가할 수 있다.
#### :four:&nbsp;&nbsp; 저장하기 버튼을 통해 정보 최신화
![portfolio_edit](/img/protfolio_edit.png)

<br>

### :scroll: My Portfolio 
#### :one:&nbsp;&nbsp; Profile
이름, 프로필 이미지, 이메일, 쪽지보내기, Github url과 position, skill <br>
#### :two:&nbsp;&nbsp; Project Timeline
'공개'로 설정한 프로젝트에 한해서 시간순으로 정렬하여 출력. <br>
프로젝트명, 참여 인원, 프로젝트 기간, 프로젝트 설명, Github repository url, 사용된 기술 명시
![portfolio](/img/portfolio.png)
