package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Board;
import logic.DevService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	DevService service;

	@GetMapping("*")
	public ModelAndView getBoard(Integer no, Integer bno, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		if (bno == null) {
			board = new Board();
		} else {
			boolean readcntable = false;
			if (request.getRequestURI().contains("detail.dev"))
				readcntable = true;
			// board: 파라미터 num에 해당하는 게시물 정보 저장
			board = service.getBoard(no, bno, readcntable);
			int point = service.getpoint(no,bno);
			mav.addObject("point",point);
		}
		mav.addObject("no", no);
		mav.addObject("board", board);
		return mav;
	}

	/*
	 * pageNum: 현재 페이지 번호 maxpage: 최대 페이지 startpage: 보여지는 시작 페이지 endpage: 보여지는 끝 페이지
	 * listcount: 전체 등록된 게시물 건수 boardlist: 화면에 보여질 게시물 객체들 boardno: 화면에 보여지는 게시물 번호
	 */
	@RequestMapping("list")
	public ModelAndView list(Integer no, Integer pageNum, String searchtype, String searchcontent) {

		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if (searchtype == null || searchtype.trim().equals("") || searchcontent == null
				|| searchcontent.trim().equals("")) {// column값이 없음
			searchtype = null;
			searchcontent = null;
		}

		int limit = 10;// 한페이지에 출력할 게시물 건수
		int listcount = service.boardCount(no, searchtype, searchcontent); // 등록 게시물 건수
		List<Board> boardlist = service.boardlist(no, pageNum, limit, searchtype, searchcontent);
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;// 시작페이지번호
		int endpage = startpage + 9;// 종료페이지 번호
		if (endpage > maxpage)
			endpage = maxpage;
		int boardno = listcount - (pageNum - 1) * limit;
		mav.addObject("no", no);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		System.out.println("===boardlist");
		System.out.println(boardlist);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardno", boardno);
		mav.addObject("today", // "20200713"
				new SimpleDateFormat("yyyyMMdd").format(new Date()));
		return mav;
	}

	@PostMapping("write")
	public ModelAndView write(Board board, BindingResult bresult, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {

			board.setNo(Integer.parseInt(request.getParameter("no")));

			service.boardWrite(board, request);
			mav.setViewName("redirect:list.dev?no=" + request.getParameter("no"));
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 등록에 실패했습니다.", "write.dev");
		}
		return mav;
	}

	@RequestMapping("imgupload")
	// upload: ckeditor에서 전달해 주는 파일 정보의 이름
	// <input type="file" name="upload">
	// CKEditorFuncNum: ckeditor에서 내부에서 사용되는 파라미터
	public String imgupload(MultipartFile upload, Model model, String CKEditorFuncNum, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/") + "board/imgfile/"; // 이미지 저장할 폴더를 지정
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		if (!upload.isEmpty()) { // 업로드된 이미지 정보가 존재함.
			File file = // 업로드될 파일을 저장할 File 객체 지정
					new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file); // 업로드 파일 생성
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = request.getServletContext().getContextPath() + "/board/imgfile/"
				+ upload.getOriginalFilename();
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckedit";
	}

	@GetMapping("delete")
	public ModelAndView delete(Board board, Integer no, Integer bno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			Board dbBoard = service.getBoard(no, bno, false);

			User user = (User) session.getAttribute("loginUser");

			System.out.println("dbboard:" + dbBoard.getName());
			System.out.println("username:" + user.getName());

			if (dbBoard.getName().equals(user.getName())) {

				service.boardDelete(dbBoard);
				service.goodorbadDelete(dbBoard);   //추가
				service.replyListDelete(dbBoard); //추가	
				mav.setViewName("redirect:list.dev?no=" + no);
				return mav;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 삭제 실패했습니다.", "delete.shop?num=");
		}
		return mav;
	}
	
	@GetMapping("likeit")
	public ModelAndView likeit(Board board, Integer no, Integer bno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = (User) session.getAttribute("loginUser");
		if (service.likechk(no, bno, user.getName()) == 0) {
			int maxgno = service.maxgno(no, bno);
			++maxgno;
			service.likeit(no, bno, maxgno, user.getName());
		} else {
			throw new BoardException("이미 추천한 게시물 입니다.", "detail.dev?bno=" + bno + "&&no=" + no);
		}
		throw new BoardException("게시물을 추천 하였습니다.", "detail.dev?bno=" + bno + "&&no=" + no);
	}

	@PostMapping("update")
	public ModelAndView update(Board board, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 유효성 검증
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			System.out.println("오류");
			return mav;

		}

		try {
			System.out.println("try");
			service.boardUpdate(board);
			mav.setViewName("redirect:detail.dev?no=" + board.getNo() + "&&bno=" + board.getBno());
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 수정 실패했습니다.", "update.shop?num=");
		}
		return mav;
	}
	
	

}
