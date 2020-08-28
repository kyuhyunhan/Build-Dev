package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Goodorbad;

public interface GoodorbadMapper {

	
	
	
	@Insert("insert into goodorbad (no,wno,gno,name, point, regdate) values (#{no},#{wno},#{gno},#{name}, 1, now())")
	void insert(Goodorbad gob);

	@Select("select IFNULL(MAX(gno),0) gno from goodorbad where no=#{no} and wno=#{wno}")
	int getmaxgno(Map<String, Object> param);


	@Delete("delete from goodorbad where no = #{no} and wno = #{wno} and name = #{name}")
	void likedelete(Map<String, Object> param);

	@Select("select * from goodorbad where no=#{no} and wno=#{wno} and name=#{name}")
	Goodorbad getlike(Map<String, Object> param);

	@Select("select * from goodorbad where no=#{no} and wno=#{wno}")
	List<Goodorbad> getGoodorbadlist2(Map<String, Object> param);

	@Select("select ifnull(max(gno),0) gno from goodorbad where no=#{no} and wno=#{wno}")
	int getmaxlike(Map<String, Object> param);

	@Delete("delete from goodorbad where no = #{no} and wno = #{wno} and name = #{name}")
	void delete_like(Map<String, Object> param);

	

}
