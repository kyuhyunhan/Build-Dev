package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {

	@Select({"<script>",
		"select * from user ",
		"<if test='id != null'> where id=#{id}</if>",
		"<if test='id == null'> where id != 'admin'</if>",
		"</script>"})
	List<User> select(Map<String, Object> param);

	@Insert("insert into user (uno, name, id, pw, email, phone, regdate, auth) values(#{uno}, #{name}, #{id}, #{pw}, #{email}, #{phone}, now(), #{auth})")
	void insert(User user);

	@Update("update user set name=#{name},email=#{email},phone=#{phone} where id=#{id}")
	void update(User user);

	@Delete("delete from user where name=#{name}")
	void delete(Map<String, Object> param);

	@Select("select ifnull(max(uno),0) uno from user")
	int getmaxuno();

	@Select("select id from user where name=#{name} and email=#{email}")
	String findId(Map<String, Object> param);
	
	@Select("select pw from user where id=#{id} and name=#{name} and email=#{email}")
	String findPw(Map<String, Object> param);

	@Update("update user set pw=#{newpw} where id=#{id}")
	void changepw(Map<String, Object> param);
	
	@Update("update user set giturl=#{giturl}, giturlable=#{giturlable} where name=#{name}")
	void giturlUpdate(User dbUser);

	@Select("Select * from user where name=#{name}")
	List<User> getPortfolio(Map<String, Object> param);
	
	@Select("select ifnull(max(alertnum),0) from user where name=#{name}")
	int getAlertNum(Map<String, Object> param);

	@Update("update user set alertnum=#{addedAlertnum} where name=#{name}")
	void warnUser(Map<String, Object> param);
	
	@Delete("delete from user where name=#{name}")
	void banUser(Map<String, Object> param);
}
