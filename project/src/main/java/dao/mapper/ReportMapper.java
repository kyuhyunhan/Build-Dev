package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Report;

public interface ReportMapper {

	@Select("select ifnull(max(wno),0) wno from report where no=#{no}")
	int getmaxwno(Map<String, Object> param);

	@Select("select ifnull(max(reno),0) reno from report")
	int getmaxreno();

	@Insert("insert into report (no, wno, reno, name, content, regdate) values (#{no}, #{wno}, #{reno}, #{name}, #{content}, now())")
	void reportInsert(Report report);

	@Select("select * from report")
	List<Report> getReports();

}
