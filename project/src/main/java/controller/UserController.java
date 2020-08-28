package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.DevService;
import logic.Message;
import logic.User;
import logic.UserFile;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private DevService service;
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		return null;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bresult,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		if(bresult.hasErrors()) {
//			bresult.reject("error.input.user");
//			return mav;
//		}
		try {
			User dbUser = service.getUser(user.getId());
			// 1. db정보의 id,password 비교
			if (user.getPw().equals(dbUser.getPw())) {
				// 2. 일치: session loginUser 정보 저장
				session.setAttribute("loginUser", dbUser);
				mav.setViewName("redirect:../main/home.dev");
			} else {
				// 3. 불일치: 비밀번호 확인 내용 출력
				bresult.reject("error.login.password");
			}
			// 4. db에 해당 id정보가 없는 경우
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
			bresult.reject("error.login.id");
		}
		return mav;
	}
	
	@PostMapping("join")
	public ModelAndView add(@Valid User user, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.user");
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			int uno = service.getmaxuno() +1;
			user.setUno(uno);
			user.setAuth("일반회원");
			service.userInsert(user);
			
			UserFile f = new UserFile();
			f.setNo(1);
			f.setWno(user.getUno());
			f.setFno(1);
			f.setName(user.getName());
			f.setFilename(user.getName()+".jpg");
			f.setFileurl("profile/");
			service.insert_file(f);
			
			mav.setViewName("redirect:login.dev");
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
		return mav;
	}
	@GetMapping(value = { "mypage", "delete" })
	public ModelAndView checkview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user;
		if(id == null) {
			user = (User)session.getAttribute("loginUser");
		} else {
			user = service.getUser(id);
		}
		mav.addObject("user", user);
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView update(@Valid User user, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		if(bresult.hasErrors()) {
//			bresult.reject("error.input.user");
//			return mav;
//		}		
		User loginUser = (User)session.getAttribute("loginUser");
		try {
			service.update(user);
			mav.setViewName("redirect:mypage.dev");
			if(loginUser.getId().equals(user.getId())) {
				session.setAttribute("loginUser", user);
			}
		}catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			bresult.reject("error.user.update");
		}
		return mav;
	}
	@PostMapping("delete")
	public ModelAndView delete(String name, String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		if(!pw.equals(loginUser.getPw())) {
			throw new LoginException
			("비밀번호 오류", "delete.dev?name=" + name);
		}
		try {
			service.delete(name);	
		}catch(Exception e) {
			e.printStackTrace();
			throw new LoginException
			("탈퇴 오류", "delete.dev?name=" + name);
		}		
		session.invalidate();
		throw new LoginException
		(name+"님 탈퇴 완료", "login.dev");		
	}
	
	@RequestMapping("main")
	// login 되어야 실행 가능. 메서드이름을 loginxxx로 지정
	public String loginCheckmain(HttpSession session) {
		return null;
	}
	
	@RequestMapping("logout")
	public String loginChecklogout(HttpSession session) {
		session.invalidate();
		return "redirect:login.dev";
	}

	@GetMapping("message")
	public ModelAndView message(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		List<Message> msglist = service.getMessageList(loginUser.getName());
		mav.addObject("msglist", msglist);
		return mav;
	}
	
}
