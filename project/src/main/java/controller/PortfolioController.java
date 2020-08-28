package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.DevService;
import logic.Project;
import logic.Tag;
import logic.User;

@Controller
@RequestMapping("portfolio")
public class PortfolioController {
	@Autowired
	private DevService service;
	
	@GetMapping("portfolio")
	public ModelAndView portfolio(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String name = request.getParameter("name");
		User pfUser  = service.getPortfolio(name);
		List<Tag> tags = service.getTags(pfUser.getUno());
		List<Project> projects = service.getProjects(name);
		
		mav.addObject("projects",projects);
		mav.addObject("tags",tags);
		mav.addObject("pfUser",pfUser);
		return mav;
	}

	@GetMapping("editPortfolio")
	public ModelAndView editPortfolio(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int userno = ((User)session.getAttribute("loginUser")).getUno();
		List<Tag> tags = service.getTags(userno);
		
		String name = ((User)session.getAttribute("loginUser")).getName();
		List<Project> projects = service.getProjects(name);
		
		mav.addObject("projects",projects);
		mav.addObject("tags",tags);
		return mav;
	}
}
