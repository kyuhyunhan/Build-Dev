package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Goodorbad;

@Repository
public class BoardDao {	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	  private String boardcolumn = "select num, name, pass, subject,"
	         + "content, file1 fileurl, regdate, readcnt, grp,"
	         + "grplevel, grpstep from board";
	
	public int maxnum(int no) {
		return template.getMapper(BoardMapper.class).maxnum(no);
	}

	public void insert(Board board) {
		template.getMapper(BoardMapper.class).insert(board);
	}

	public int count(int no,String searchtype, String searchcontent) {
		
//		String sql = "select count(*) from board";
//		if(searchtype != null && searchcontent != null) {
//			sql += " where " + searchtype + " like :searchcontent ";
//			param.clear();
//			param.put("searchcontent", "%" + searchcontent + "%");
//		}
		
		param.clear();
		param.put("no",no);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		System.out.println(param);
		return template.getMapper(BoardMapper.class).count(param);
	}

	public List<Board> list(int no,Integer pageNum, int limit, String searchtype, String searchcontent) {
		param.clear();

		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("no",no);
		System.out.println(param);
		return template.getMapper(BoardMapper.class).list(param);
	}

	public List<Board> list2(int no, int limit) {
		param.clear();

		param.put("limit", limit);
		param.put("no",no);
		System.out.println(param);
		return template.getMapper(BoardMapper.class).list2(param);
	}
	
	public Board detail(int no, int bno) {
		param.clear();
		param.put("no", no);
		param.put("bno", bno);
		
		return template.getMapper(BoardMapper.class).detail(param);
	}

	public void readcnt(int num) {
		param.clear();
		param.put("no", num);
		template.getMapper(BoardMapper.class).readcnt(param);
	}



	public void update(Board board) {

		template.getMapper(BoardMapper.class).update(board);
	}

	public void delete(Board board) {

		template.getMapper(BoardMapper.class).delete(board);
	}

	public void likeit(Integer no, Integer bno,Integer gno, String name) {
		param.clear();
		param.put("no", no);
		param.put("bno", bno);
		param.put("gno", gno);
		param.put("name", name);
		template.getMapper(BoardMapper.class).likeit(param);

	}

	public int maxgno(Integer no, Integer bno) {
		param.clear();
		param.put("no", no);
		param.put("bno", bno);
		return template.getMapper(BoardMapper.class).maxgno(param);
	}

	public int likechk(Integer no, Integer bno, String name) {
		param.clear();
		param.put("no", no);
		param.put("bno", bno);
		param.put("name", name);

		return template.getMapper(BoardMapper.class).likechk(param);
	}

	public List<Goodorbad> goodorbadlist(Integer no,Integer pageNum, int limit) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("no",no);	
		return template.getMapper(BoardMapper.class).goodorbadlist(param);
	}

	public int getpoint(Integer no, Integer bno) {
		param.clear();
		param.put("no",no);	
		param.put("bno",bno);	
		System.out.println("===getpoint");
		System.out.println(param);
		return template.getMapper(BoardMapper.class).getpoint(param);
	}

	public List<Board> getCommunitylist(int no, int num, int limit) {
		param.clear();
		param.put("no", no);
		param.put("num", num);
		param.put("limit", limit);
		return template.getMapper(BoardMapper.class).getCommunitylist(param);
	}

	public void goodorbadDelete(Board board) {
		template.getMapper(BoardMapper.class).goodorbadDelete(board);
		
	}

	public void replyListDelete(Board board) {
		template.getMapper(BoardMapper.class).replyListDelete(board);
		
	}


}
