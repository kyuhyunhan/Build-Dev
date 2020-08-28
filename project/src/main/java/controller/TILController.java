package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Coworking;
import logic.DevService;
import logic.Goodorbad;
import logic.Hashtag;
import logic.Subscribe;
import logic.TIL;
import logic.User;


@Controller // controller
@RequestMapping("til") // path
public class TILController {
	@Autowired
	DevService service;

	@GetMapping("*")
	public ModelAndView list(Integer no, Integer bno, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		TIL til = null;
		if (bno == null) {
			til = new TIL();
		} else {
			til = service.getTil(no, bno); // board:파라미터 bno에 해당하는 게시물 정보 저장
		}
		til.setNo(3);
		mav.addObject("til", til);
		return mav;
	}

	@PostMapping("write")
	public ModelAndView board(TIL til, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			til.setBno(service.getmaxbno(3)+1);
			til.setNo(3);
			service.Til_insert(til);
			mav.setViewName("redirect:main.dev");

		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 등록에 실패 했습니다.", "write.dev");
		}
		return mav;
	}

	@RequestMapping("main")
	public ModelAndView tillist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List <TIL> list = service.getTillist(null, "title", 0, 0, 12);
		List <Hashtag> hash = service.getHashtaglist(3);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getBno(), i);
		}
		for(Hashtag h : hash) {
			if(map.containsKey(h.getWno())) {
				list.get(map.get(h.getWno())).addHashlist(h.getHashname());
			}
		}
		mav.addObject("tillist", list);
		return mav;
	}

	@RequestMapping("mytil")
	public ModelAndView mytillist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String name = ((User)session.getAttribute("loginUser")).getName();
		List<TIL> tillist = service.mytillist(name);
		mav.addObject("tillist", tillist);

		return mav;

	}

	@GetMapping("delete")
	public ModelAndView delete(TIL til, Integer no, Integer bno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			TIL dbTil = service.getTil(no, bno);

			System.out.println("dbTil:" + dbTil.getName());

			service.tilDelete(dbTil);
			mav.setViewName("redirect:main.dev");
			return mav;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView update(TIL til, HttpServletRequest request) {
		System.out.println(til);
		ModelAndView mav= new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		til.setNo(no);
		til.setBno(bno);
		System.out.println(til);
		try {
			service.tilUpdate(til, request);
			
			mav.setViewName("redirect:info.dev?no=" + til.getNo() + "&bno=" + til.getBno());
		}catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 수정 오류입니다.", "update.dev?no=" + til.getNo() + "&&bno=" + til.getBno());
		}
		
		return mav;
	}
	
	@GetMapping("info")
	public ModelAndView loginCheckinfo(Integer no, Integer bno, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		TIL til = service.getTil(no, bno); // board:파라미터 bno에 해당하는 게시물 정보 저장
		User user = (User)session.getAttribute("loginUser");
		if (user != null) {
			String scrapped = til.getName();
			String scrapper = ((User)session.getAttribute("loginUser")).getName();
			Subscribe sub = new Subscribe();
			sub = service.getSubscribe(scrapper, scrapped);
			mav.addObject("sub",sub);
			String name = user.getName();
			int wno = til.getBno();
			Goodorbad gob= new Goodorbad();
			gob = service.getPoint(no,wno,name); 
			mav.addObject("gob", gob);
			
			int count = service.getcount(no,bno);
			mav.addObject("count",count);
		}
		
		List <Goodorbad> goodlist = service.getGoodorbadlist2(3, bno);
		int chk = 0;
		for (int i = 0; i < goodlist.size(); i++) {
			if(goodlist.get(i).getName().equals(user.getName())) chk = 1;
		}
		mav.addObject("likechk", chk);
		mav.addObject("likecnt", goodlist.size());
		List <Hashtag> hashlist = service.getHashtaglist2(3, bno);
		mav.addObject("hashlist", hashlist);
		mav.addObject("til", til);
		return mav;
	}
	
	
	@RequestMapping("subuser")
	public ModelAndView subuser(Subscribe sub, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User scrapper = (User)session.getAttribute("loginUser");
		sub.setScrapper(scrapper.getName());
		List<User> list = service.getUserList();
		List<Subscribe> subuser = service.getsubuser();
		mav.addObject("list", list);
		mav.addObject("subuser", subuser);
		return mav;
	}
	

}
