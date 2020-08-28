package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Subscribe;

public interface SubscribeMapper {

	@Insert("insert into Subscribe (scrapper,scrapped) "
			+"values (#{scrapper},#{scrapped})")
	void insert(Subscribe sub);

	@Delete("delete from Subscribe where scrapper= #{scrapper} and scrapped=#{scrapped}")
	void delete(Subscribe sub);

	@Select("select * from subscribe where scrapper=#{scrapper} and scrapped=#{scrapped}")
	Subscribe getSubscribe(Map<String, Object> param);
	
	@Select("select * from subscribe")
	List<Subscribe> getsubuser();

}
