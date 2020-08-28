package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String,Object> param = new HashMap<>();
	
	public User selectOne(String id) {
		param.clear();
		param.put("id",id);	
		return template.getMapper(UserMapper.class).select(param).get(0);
	}

	public void insert(User user) {
		template.getMapper(UserMapper.class).insert(user);
	}

	public void update(User user) {
		template.getMapper(UserMapper.class).update(user);
	}

	public void delete(String name) {
		param.clear();
		param.put("name", name);
		template.getMapper(UserMapper.class).delete(param);
	}

	public int getmaxuno() {
		return template.getMapper(UserMapper.class).getmaxuno();
	}
	
	public List<User> getUserList() {
		return template.getMapper(UserMapper.class).select(null);
	}
	
	public String findId(String name, String email) {
		param.clear();
		param.put("name", name);
		param.put("email", email);
		return template.getMapper(UserMapper.class).findId(param);
	}
	
	public String findPw(String id, String name, String email) {
		param.clear();
		param.put("id", id);
		param.put("name", name);
		param.put("email", email);
		return template.getMapper(UserMapper.class).findPw(param);
	}

	public void changepw(String id, String newpw) {
		param.clear();
		param.put("id", id);
		param.put("newpw", newpw);
		template.getMapper(UserMapper.class).changepw(param);
	}
	
	public void giturlUpdate(User dbUser) {
		template.getMapper(UserMapper.class).giturlUpdate(dbUser);
	}

	public User getPortfolio(String name) {
		param.clear();
		param.put("name",name);	
		return template.getMapper(UserMapper.class).getPortfolio(param).get(0);
	}
	
	public int getAlertNum(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(UserMapper.class).getAlertNum(param);
	}

	public void warnUser(int addedAlertnum, String name) {
		param.clear();
		param.put("name", name);
		param.put("addedAlertnum", addedAlertnum);
		template.getMapper(UserMapper.class).warnUser(param);
	}
	
	public void banUser(String name) {
		param.clear();
		param.put("name", name);
		template.getMapper(UserMapper.class).banUser(param);
	}
}
