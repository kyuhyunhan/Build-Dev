package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDao {
	@Autowired
	private SqlSessionTemplate template;
	Map<String,Object> param = new HashMap<>();
	
	
}
