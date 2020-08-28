package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ProjectMapper;
import logic.Project;
import logic.Tag;

@Repository
public class ProjectDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public void positionTagsClear(int positionNo, int userno) {
		param.clear();
		param.put("positionNo", positionNo);
		param.put("userno", userno);
		template.getMapper(ProjectMapper.class).positionTagsClear(param);
	}

	public void skillsTagsClear(int skillsNo, int userno) {
		param.clear();
		param.put("skillsNo", skillsNo);
		param.put("userno", userno);
		template.getMapper(ProjectMapper.class).skillsTagsClear(param);
	}

	public int getMaxTno() {
		return template.getMapper(ProjectMapper.class).getMaxTno();
	}

	public void insert(Tag tag) {
		template.getMapper(ProjectMapper.class).insertTag(tag);
	}

	public List<Tag> getTags(int userno) {
		param.clear();
		param.put("userno", userno);
		return template.getMapper(ProjectMapper.class).getTags(param);
	}

	public int getMaxProno(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(ProjectMapper.class).getMaxProno(param);
	}

	public void addProject(Project newproject) {
		template.getMapper(ProjectMapper.class).addProject(newproject);
	}

	public List<Project> getProjects(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(ProjectMapper.class).getProjects(param);
	}

	public void updateProjectAble(String username, int prono) {
		param.clear();
		param.put("name",username);
		param.put("prono",prono);
		template.getMapper(ProjectMapper.class).updateProjectAble(param);
	}

	public void clearProjectable(String name) {
		param.clear();
		param.put("name",name);
		template.getMapper(ProjectMapper.class).clearProjectable(param);
	}
	
	public void deleteProject(String username, int prono) {
		param.clear();
		param.put("name", username);
		param.put("prono", prono);
		template.getMapper(ProjectMapper.class).deleteProject(param);
	}
	

}
