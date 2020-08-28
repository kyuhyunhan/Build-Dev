package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Coworking;
import logic.Hashtag;

public interface CoworkingMapper {

	@Select("select ifnull(max(gno),0) gno from working")
	int getmaxcono();

	@Insert("insert INTO working (gno, name, title, category, content, maxnum, startdate, enddate, deadline, process, grade, loc, regdate) "
			+ "values(#{gno}, #{name}, #{title}, #{category}, #{content}, #{maxnum}, #{startdate}, #{enddate}, #{deadline}, #{process}, #{grade}, #{loc}, now())")
	void insert(Coworking coworking);

	@Select("select * from working where gno = #{gno}")
	Coworking getdetails(Integer gno);

	   @Select({"<script> select gno, name, title, category, content, maxnum, startdate, enddate, deadline, process, grade, loc, regdate, (TO_DAYS(deadline) - TO_DAYS(NOW())) as date from working "
		         + "<where>"
		         + "<if test='searchtype != null and searchinput != null '> ${searchtype} like '%${searchinput}%' </if>"
		         + "<if test='category != null'> and category = #{category} </if>"
		         + "and (TO_DAYS(deadline) - TO_DAYS(NOW())) >= 0"
		         + "</where>"
		         + "<if test='searchsort != null '> order by regdate desc </if> "
		         + "<if test='searchsort == null '> order by deadline </if> "
		         + " limit #{num} , #{limit}  "
		         + "</script>"})
	   List<Coworking> getWorkinglist(Map<String, Object> param);

	@Insert("insert into hash (no, wno, hno, hashname) values(#{no}, #{wno}, #{hno}, #{hashname})")
	void insertHashtag(Hashtag hash);

	@Select("select * from hash where no = #{no}")
	List<Hashtag> getHashtaglist(Map<String, Object> param);
	
	@Select({"<script>SELECT *, (TO_DAYS(deadline) - TO_DAYS(NOW())) as date from hash LEFT JOIN working ON hash.wno = working.gno where ${searchtype} like '%${searchinput}%' and NO = 6 and (TO_DAYS(deadline) - TO_DAYS(NOW())) >= 0 "
			+ "<if test='category != null and searchtype != null'> and category = #{category} </if>"
			+ " group by wno "
			+ "<if test='searchsort != null '> order by regdate desc </if> "
			+ "<if test='searchsort == null '> order by deadline </if> "
			+ "</script>"})
	List<Coworking> getHashWorkinglist(Map<String, Object> param);

	@Select("SELECT user_group.gno, working.category, working.title, working.name from working JOIN user_group ON user_group.gno = working.gno " + 
			"where user_group.name = #{name} and chk = '승인'")
	List<Coworking> getUsergroup(Map<String, Object> param);

	@Select("SELECT title FROM working WHERE gno = ${gno}")
	String grouptitle(Map<String, Object> param);

	@Select("select * from hash where no = #{no} and wno = #{wno}")
	List<Hashtag> getHashtaglist2(Map<String, Object> param);
}
