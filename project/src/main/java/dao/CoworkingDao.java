package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CoworkingMapper;
import logic.Coworking;
import logic.Hashtag;

@Repository
public class CoworkingDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	public int getmaxno() {
		return template.getMapper(CoworkingMapper.class).getmaxcono();
	}

	public void insert(Coworking coworking) {
		template.getMapper(CoworkingMapper.class).insert(coworking);
	}

	public Coworking getdetails(Integer gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(CoworkingMapper.class).getdetails(gno);
	}

	public List<Coworking> getWorkinglist(String searchtype, String searchinput, String searchsort, int category, int num, int limit) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchinput", searchinput);
		param.put("num", num);
		param.put("limit", limit);
		if(searchsort.equals("regdate")) param.put("searchsort", searchsort);
		if(category == 1) param.put("category", "스터디");
		else if(category == 2) param.put("category", "프로젝트");
		else if(category == 3) param.put("category", "공모전");
		System.out.println(param);
		if(searchtype != null && searchtype.equals("hashname")) return template.getMapper(CoworkingMapper.class).getHashWorkinglist(param);
		return template.getMapper(CoworkingMapper.class).getWorkinglist(param);
	}

	public void insertHashtag(Hashtag hash) {
		template.getMapper(CoworkingMapper.class).insertHashtag(hash);
	}

	public List<Hashtag> getHashtaglist(int no) {
		param.clear();
		param.put("no", no);
		return template.getMapper(CoworkingMapper.class).getHashtaglist(param);
	}

	public List<Coworking> getUsergroup(String name) {
		param.clear();
		param.put("name",name);
		return template.getMapper(CoworkingMapper.class).getUsergroup(param);
	}
	
	public String grouptitle(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(CoworkingMapper.class).grouptitle(param);
	}

	public List<Hashtag> getHashtaglist2(int no, Integer bno) {
		param.clear();
		param.put("no", no);
		param.put("wno", bno);
		return template.getMapper(CoworkingMapper.class).getHashtaglist2(param);
	}
}
