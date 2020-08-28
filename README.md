# 구디아카데미 팀 프로젝트 Build-Dev
> 1. 프로젝트 소개
> 1. 담당 개발 업무

<br>

## 1. 프로젝트 소개
> 개발자를 위한 자기계발 사이트
> 개발자들의 포트폴리오 관리 및 다양한 소통 공간을 제공하는 플랫폼

##### :one: 포트폴리오 관리 : 자신의 프로젝트와 개발 관련 정보를 관리한다.
##### :two:  TIL(Today I Learned) : 스스로 학습한 내용을 기록하고 공유한다.
##### :three:  커뮤니티 : 자유게시판, Q&A 게시판을 통해 다른 유저들과 소통한다.
##### :four:  Co-Working : 개발자들이 함께 모여 프로젝트/스터디/공모전을 계획하고 준비할 수 있도록 돕는 플랫폼이다.

<br>

## 2. 담당 개발 업무  
### 회원 관리 및 공통 기능
:one: 회원 가입 화면 및 유효성 검사<br>
:two: 로그인, 아이디 찾기 및 비밀번호 찾기<br>
:three: 로그아웃<br>
:four: 회원 정보 수정 및 탈퇴, 비밀번호 변경하기<br>
:five: 쪽지 보내기 및 쪽지 보관함(받은 쪽지함/보낸쪽지함)

<br>

### 관리자 페이지
:one: 신고 관리 및 회원 관리<br>
:two: 신고된 회원에게 경고메세지 발송. 경고받은 회원은 횟수 카운트됨 (AJAX)

<br>

### 프로필 모달(회원 이름 클릭 시 모달 팝업)
:one: 포트폴리오 링크, my TIL 링크, 쪽지 보내기, 신고하기<br>
:two: 쪽지 보내기와 신고하기는 추가 모달 통해 사용 (AJAX)

<br>

### My Portfolio 작성 / 수정
:one: 자신의 Position, Skill 관련 정보를 태그를 이용하여 입력 및 삭제<br>
:two: Github url 추가, 공개/비공개 설정<br>
:three: 프로젝트 추가/삭제, 공개 여부 설정 (AJAX)<br>
:four: 저장하기 버튼을 통해 정보 최신화 (AJAX)

<br>

### My Portfolio 
:one: <Profile> : 이름, 프로필 이미지, 이메일, 쪽지보내기, Github url과 position, skill <br>
:two: <Project Timeline> : '공개'로 설정한 프로젝트에 한해서 시간순으로 정렬하여 출력. 프로젝트명, 참여 인원 및 기간, 세부내용, Github url, 사용 기술 명시
