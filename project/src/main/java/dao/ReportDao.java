package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReportMapper;
import logic.Report;

@Repository
public class ReportDao {
	
	@Autowired
	private SqlSessionTemplate template;
	Map<String,Object> param = new HashMap<>();
	
	public int getmaxwno(int no) {
		param.clear();
		param.put("no",no);
		return template.getMapper(ReportMapper.class).getmaxwno(param);
	}

	public int getmaxreno() {
		return template.getMapper(ReportMapper.class).getmaxreno();
	}

	public void reportInsert(Report report) {
		template.getMapper(ReportMapper.class).reportInsert(report);
	}

	public List<Report> getReports() {
		return template.getMapper(ReportMapper.class).getReports();
	}

}
