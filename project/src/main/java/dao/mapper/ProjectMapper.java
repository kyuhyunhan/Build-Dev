package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Project;
import logic.Tag;

public interface ProjectMapper {

	@Delete("Delete from tag where wno=#{userno} and no=#{positionNo}")
	void positionTagsClear(Map<String, Object> param);

	@Delete("Delete from tag where wno=#{userno} and no=#{skillsNo}")
	void skillsTagsClear(Map<String, Object> param);

	@Select("Select ifnull(max(tno),0) from tag")
	int getMaxTno();
	
	@Insert("Insert into tag (no, wno, tno, prono, tag) values (#{no}, #{wno}, #{tno}, #{prono}, #{tag})")
	void insertTag(Tag tag);

	@Select("Select * from tag where wno=#{userno}")
	List<Tag> getTags(Map<String, Object> param);

	@Select("Select ifnull(max(prono),0) from project where name=#{name}")
	int getMaxProno(Map<String, Object> param);

	@Insert("Insert into project (name, prono, subject, num, description, repository, able, start, end) values (#{name}, #{prono}, #{subject}, #{num}, #{description}, #{repository}, #{able}, #{start}, #{end})")
	void addProject(Project newproject);

	@Select("Select * from project where name=#{name} order by start")
	List<Project> getProjects(Map<String, Object> param);

	@Update("Update project set able=true where name=#{name} and prono=#{prono}")
	void updateProjectAble(Map<String, Object> param);

	@Update("Update project set able=false where name=#{name}")
	void clearProjectable(Map<String, Object> param);

	@Delete("Delete from project where name=#{name} and prono=#{prono}")
	void deleteProject(Map<String, Object> param);
}
