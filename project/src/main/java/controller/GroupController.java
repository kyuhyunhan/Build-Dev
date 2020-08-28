package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.Coworking;
import logic.DevService;
import logic.User;
import logic.Usergroup;

@Controller // controller 역할을 수행하는 @Component 객체이다.
@RequestMapping("group") // path에 cart으로 들어오는 요청을 처리해준다. (/cart/)
public class GroupController {
	@Autowired
	private DevService service;
	
	@GetMapping("*") 
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("memberlist")
	public ModelAndView adminList(Integer gno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		String name = loginUser.getName();
		List<Coworking> group = service.getUsergroup(name);
		List<Coworking> study = new ArrayList<Coworking>();
		List<Coworking> contest = new ArrayList<Coworking>();
		List<Coworking> project = new ArrayList<Coworking>();
		for(Coworking g : group) {
			if (g.getCategory().equals("스터디")) study.add(g);
			else if (g.getCategory().equals("공모전")) contest.add(g);
			else project.add(g);
		}
		mav.addObject("study",study);
		mav.addObject("contest",contest);
		mav.addObject("project",project);
		mav.addObject("group",group);
		List<Usergroup> member = service.getMemberList(gno);
		List<Usergroup> apply = service.getApplyList(gno); 
		mav.addObject("member",member);
		mav.addObject("apply",apply);
		return mav;
	}
	@GetMapping("main")
	public ModelAndView loginCheckmain(Integer gno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		String name = loginUser.getName();
		List<Coworking> group = service.getUsergroup(name);
		List<Coworking> study = new ArrayList<Coworking>();
		List<Coworking> contest = new ArrayList<Coworking>();
		List<Coworking> project = new ArrayList<Coworking>();
		for(Coworking g : group) {
			if (g.getCategory().equals("스터디")) study.add(g);
			else if (g.getCategory().equals("공모전")) contest.add(g);
			else project.add(g);
		}
		mav.addObject("study",study);
		mav.addObject("contest",contest);
		mav.addObject("project",project);
		mav.addObject("group",group);
		if(gno != null) {
			Coworking cwk = service.getdetails(gno);
			String grouptitle = service.grouptitle(gno);
			mav.addObject("grouptitle",grouptitle);
			
			int limit=10;
			List<Board> boardlist = service.boardlist2(gno+100, limit);	
			List<Usergroup> member = service.getMember(gno);
			String membermaster = service.getMembermaset(gno);
			mav.addObject("cwk",cwk);
			int membercount = service.getMembercount(gno);
			int membermax = service.getMembermax(gno);
			mav.addObject("boardlist",boardlist);
			mav.addObject("membermaster",membermaster);
			mav.addObject("membermax",membermax);
			mav.addObject("member",member);
			mav.addObject("membercount",membercount);
		}
		return mav;
	}
	@GetMapping("accept")
	public ModelAndView accept(String name,int gno) {
		ModelAndView mav = new ModelAndView();
		service.accept(name);
		mav.setViewName("redirect:memberlist.dev?gno=" + gno);
		return mav;
	}	
	@GetMapping("deport")
	public ModelAndView deport(String name,int gno) {
		ModelAndView mav = new ModelAndView();
		service.deport(name,gno);
		mav.setViewName("redirect:memberlist.dev?gno=" + gno);
		return mav;
	}
}
