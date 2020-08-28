package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Coworking;
import logic.DevService;
import logic.Hashtag;
import logic.User;

@Controller // controller 역할을 수행하는 @Component 객체이다.
@RequestMapping("coworking") // path에 cart으로 들어오는 요청을 처리해준다. (/cart/)
public class CoworkingController {

	@Autowired
	private DevService service;
	
	@GetMapping("*")
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List <Coworking> list = service.getWorkinglist(null, null, "regdate", 0, 0, 12);
		List <Hashtag> hash = service.getHashtaglist(6);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getGno(), i);
		}
		for(Hashtag h : hash) {
			if(map.containsKey(h.getWno())) {
				list.get(map.get(h.getWno())).addHashlist(h.getHashname());
			}
			
		}
		mav.addObject("list", list);
		mav.addObject("hash", hash);
		return mav;
	}
	
	@GetMapping("register")
	public String loginCheckform(Model model, HttpSession session) {
		Coworking coworking = new Coworking();
		coworking.setName(((User)session.getAttribute("loginUser")).getName());
		model.addAttribute(coworking);
		return null;
	}
	
	@GetMapping("details")
		public ModelAndView loginCheckform(Integer gno, String name, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			try {
				Coworking cwk = service.getdetails(gno);
				int membercount = service.getMembercount(gno);
				int membermax = service.getMembermax(gno);
				int recruitment = (membermax - membercount);
				String chk = service.getChk(gno,name);
				List <Coworking> list = service.getWorkinglist(null, null, "regdate", 0, 0, 12);
				List <Hashtag> hash = service.getHashtaglist(6);
				HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
				for (int i = 0; i < list.size(); i++) {
					map.put(list.get(i).getGno(), i);
				}
				for(Hashtag h : hash) {
					if(map.containsKey(h.getWno())) {
						list.get(map.get(h.getWno())).addHashlist(h.getHashname());
					}
				}
				System.out.println(list);
				System.out.println(hash);
				mav.addObject("list", list);
				mav.addObject("hash", hash);
				mav.addObject("chk",chk);
				mav.addObject("recruitment",recruitment);
				mav.addObject("cwk",cwk);
			}catch(Exception e) {
				e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("details")
	public ModelAndView join(int gno, String name,String lang, String comment) {
		ModelAndView mav = new ModelAndView();
		try {			
			service.ugroupJoin(gno,name,lang,comment);
			mav.setViewName("redirect:main.dev");
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("register")
	public ModelAndView add(@Valid Coworking coworking, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		System.out.println(coworking);
		try {
			int cono = service.getmaxcono() +1;
			//로그인정보 수정
			User loginUser = (User) session.getAttribute("loginUser");
			String name = loginUser.getName();
			coworking.setGno(cono);
			coworking.setName(name);
			service.coworkingInsert(coworking);
			service.ugroupJoinMaster(cono,name);
			mav.setViewName("redirect:main.dev");
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
		return mav;
	}
}
