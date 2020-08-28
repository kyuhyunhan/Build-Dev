package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MessageMapper;
import logic.Message;

@Repository
public class MessageDao {

	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public int maxmno() {
		return template.getMapper(MessageMapper.class).getmaxmno();
	}
	public void messageInsert(Message msg) {
		template.getMapper(MessageMapper.class).insert(msg);
	}
	public List<Message> getMessageList(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(MessageMapper.class).getMessageList(param);
	}
	
	public void deleteMessage(int meno) {
		param.clear();
		param.put("meno", meno);
		template.getMapper(MessageMapper.class).deleteMessage(param);
	}
}
