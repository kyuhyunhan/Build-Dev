package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserGroupMapper;
import logic.Coworking;
import logic.Usergroup;


@Repository
public class UserGroupDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String,Object> param = new HashMap<>();
	
	public void join(int gno,String name, String lang, String comment) {
		param.clear();
		param.put("gno",gno);
		param.put("name", name);
		param.put("lang", lang);
		param.put("comment", comment);
		template.getMapper(UserGroupMapper.class).join(param);
	}

	public List<Usergroup> getMemberList(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getMemberList(param);
	}

	public void ugroupJoinMaster(int cono, String name) {
		param.clear();
		param.put("gno",cono);
		param.put("name", name);
		template.getMapper(UserGroupMapper.class).ugroupJoinMaster(param);
	}

	public List<Usergroup> getApplyList(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getApplyList(param);
	}

	public void accept(String name) {
		param.clear();
		param.put("name",name);
		template.getMapper(UserGroupMapper.class).accept(param);
	}

	public void deport(String name, int gno) {
		param.clear();
		param.put("name",name);
		param.put("gno",gno);
		template.getMapper(UserGroupMapper.class).deport(param);
	}

	public List<Usergroup> getMember(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getMember(param);
	}

	public int getMembercount(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getMembercount(param);
	}

	public int getMembermax(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getMembermax(param);
	}

	public String getMembermaset(int gno) {
		param.clear();
		param.put("gno",gno);
		return template.getMapper(UserGroupMapper.class).getMembermaset(param);
	}

	public String getChk(Integer gno, String name) {
		param.clear();
		param.put("gno",gno);
		param.put("name",name);
		return template.getMapper(UserGroupMapper.class).getChk(param);
	}
}
