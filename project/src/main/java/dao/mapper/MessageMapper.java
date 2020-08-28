package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Message;

public interface MessageMapper {

	@Select("select ifnull(max(meno),0) meno from message")
	int getmaxmno();

	@Insert("insert into message (meno, me_from, me_to, title, content, regdate) values (#{meno}, #{me_from}, #{me_to}, #{title}, #{content}, now())")
	void insert(Message msg);

	@Select("select * from message where me_from=#{name} or me_to=#{name}")
	List<Message> getMessageList(Map<String, Object> param);

	@Delete("delete from message where meno=#{meno}")
	void deleteMessage(Map<String, Object> param);
}
