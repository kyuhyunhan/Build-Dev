package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import dao.mapper.GoodorbadMapper;

import logic.Goodorbad;

@Repository
public class GoodorbadDao {

	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	
	public void insert(Goodorbad gob) {
		template.getMapper(GoodorbadMapper.class).insert(gob);
	}

	public int getmaxgno(int no, int wno) {
		param.clear();
		param.put("no",no);
		param.put("wno",wno);
		return template.getMapper(GoodorbadMapper.class).getmaxgno(param);
	}

	public void likedelete(int no, int wno, String name) {
		param.clear();
		param.put("no",no);
		param.put("wno",wno);
		param.put("name",name);
		template.getMapper(GoodorbadMapper.class).likedelete(param);
	}

	public Goodorbad getlike(Integer no, int wno, String name) {
		param.clear();
		param.put("no",no);
		param.put("wno",wno);
		param.put("name",name);
		return template.getMapper(GoodorbadMapper.class).getlike(param);
	}

	public List<Goodorbad> getGoodorbadlist2(Integer no, Integer bno) {
		param.clear();
		param.put("no",no);
		param.put("wno",bno);
		return template.getMapper(GoodorbadMapper.class).getGoodorbadlist2(param);
	}

	public int getmaxlike(int no, int wno) {
		param.clear();
		param.put("no",no);
		param.put("wno",wno);
		return template.getMapper(GoodorbadMapper.class).getmaxlike(param);
	}

	public void insert_like(Goodorbad g) {
		template.getMapper(GoodorbadMapper.class).insert(g);
	}

	public void delete_like(int no, int wno, String name) {
		param.clear();
		param.put("no",no);
		param.put("wno",wno);
		param.put("name",name);
		template.getMapper(GoodorbadMapper.class).delete_like(param);
	}

	
	
	

}
