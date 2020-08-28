package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.FileMapper;
import logic.UserFile;


@Repository
public class FileDao {

	@Autowired
	private SqlSessionTemplate template;
	private Map <String, Object> param = new HashMap <String, Object> ();
	
	public void insert_file(UserFile f) {
		template.getMapper(FileMapper.class).insert_file(f);
	}

	public void update_file(UserFile f) {
		template.getMapper(FileMapper.class).update_file(f);
	}
}
