package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import dao.mapper.ReplyMapper;
import logic.Reply;

@Repository
public class ReplyDao {

	@Autowired
	private SqlSessionTemplate template;
	Map<String,Object> param = new HashMap<>();
	
	
	
	public int maxnum(Reply reply) {
		return template.getMapper(ReplyMapper.class).maxnum(reply);
	}
	
	

	public void replyInsert(Reply reply) {
		template.getMapper(ReplyMapper.class).replyInsert(reply);
		
	}


	public List<Reply> replyList(Reply reply) {
		return template.getMapper(ReplyMapper.class).replyList(reply);
		
	}



	public void replyDelete(Reply reply) {
		template.getMapper(ReplyMapper.class).replyDelete(reply);
	}

	public void replyUpdate(Reply reply) {
		template.getMapper(ReplyMapper.class).replyUpdate(reply);
		
	}

}
