package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;


import dao.mapper.SubscribeMapper;

import logic.Subscribe;

@Repository
public class SubcribeDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param= new HashMap<>();

	public void insert(Subscribe sub) {

			template.getMapper(SubscribeMapper.class).insert(sub); 
			
			
		
		
	}

	public void delete(Subscribe sub) {
		System.out.println("+++++++++++++++++");
		System.out.println(sub);
		template.getMapper(SubscribeMapper.class).delete(sub); 
		
	}

	public Subscribe getSubscribe(String scrapper, String scrapped) {
		param.clear();
		param.put("scrapper",scrapper);
		param.put("scrapped",scrapped);
		return template.getMapper(SubscribeMapper.class).getSubscribe(param);
	}

	public List<Subscribe> getsubuser() {
		return template.getMapper(SubscribeMapper.class).getsubuser();
	}

}
