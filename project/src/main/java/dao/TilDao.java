package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.CoworkingMapper;
import dao.mapper.TilMapper;
import logic.TIL;

@Repository
public class TilDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<>();

	public void insert(TIL til) {
		System.out.println("========til.insert");
		System.out.println(til);
		template.getMapper(TilMapper.class).insert(til);
	}

	public TIL selectOne(int no, int bno) {

		param.clear();
		param.put("no", no);
		param.put("bno", bno);
		return template.getMapper(TilMapper.class).selectOne(param);
	}

	public void delete(TIL til) {
		template.getMapper(TilMapper.class).delete(til);

	}

	public void update(TIL til) {
		template.getMapper(TilMapper.class).update(til);
		
	}

	public List<TIL> mytillist(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(TilMapper.class).mytillist(param);
	}
	
	public int getcount(Integer no, Integer bno) {
		param.clear();
		param.put("no",no);	
		param.put("bno",bno);	
		return template.getMapper(TilMapper.class).getcount(param);
	}

	public int getmaxbno(int no) {
		param.clear();
		param.put("no",no);
		return template.getMapper(TilMapper.class).getmaxbno(param);
	}

	public List<TIL> getTillist(String input, String type, int sort, int num, int limit) {
		param.clear();
		param.put("searchinput",input);
		param.put("searchtype",type);
		param.put("no",3);
		if(sort == 0) param.put("searchsort","regdate");
		else if(sort == 1) param.put("searchsort","point");
		param.put("num",num);
		param.put("limit",limit);
		System.out.println(param);
		if(type != null && type.equals("hashname")) return template.getMapper(TilMapper.class).getHashTillist(param);
		return template.getMapper(TilMapper.class).getTillist(param);
	}
}
