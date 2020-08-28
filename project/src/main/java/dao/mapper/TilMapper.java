package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.TIL;

public interface TilMapper {

	@Insert("insert into board(no,bno,name,title,content,regdate,open)  values (#{no},#{bno},#{name},#{title},#{content},now(),#{open})")
	void insert(TIL til);

	@Select("select no,bno,name,title,content,regdate,open from board where no=#{no} and bno=#{bno}")
	TIL selectOne(Map<String, Object> param);

	@Delete("delete from board where no= #{no} and bno=#{bno}")
	void delete(TIL til);

	@Update("update board set name= #{name}, title= #{title}, content= #{content}, open=#{open}   where no= #{no} and bno=#{bno}")
	void update(TIL til);
	
	@Select("select * from board where no = 3 and name=#{name} ORDER BY regdate desc")
	List<TIL> mytillist(Map<String, Object> param);
	
	@Select("SELECT IFNULL(COUNT(*),0) FROM goodorbad WHERE NO=#{no} AND wno=#{bno}")
	int getcount(Map<String, Object> param);

	@Select("select ifnull(max(bno),0) from board where no=#{no}")
	int getmaxbno(Map<String, Object> param);

	@Select({"<script> select b.no, b.bno, b.name, b.title, b.regdate, b.open, IFNULL(SUM(g.POINT),0) point FROM board b LEFT JOIN goodorbad g ON b.no = g.no AND b.bno = g.wno "
	         + "<where>"
	         + "<if test='searchtype != null and searchinput != null '> ${searchtype} like '%${searchinput}%' </if>"
	         + "<if test='no != null '> and b.no = #{no} and open = 0 </if>"
	         + "</where>"
	         + " GROUP BY b.bno  "
	         + "<if test='searchsort != null '> order by ${searchsort} desc </if> "
	         + " limit #{num} , #{limit}  "
	         + "</script>"})
	List<TIL> getTillist(Map<String, Object> param);

	
	@Select({"<script>SELECT b.no, b.bno, b.name, b.title, b.regdate, b.open, IFNULL(SUM(g.point),0) point FROM hash h  LEFT JOIN board b ON h.wno = b.bno LEFT JOIN goodorbad g ON h.no = g.no AND h.wno = g.wno  "
			 + "<where>"
	         + "<if test='searchtype != null and searchinput != null '> ${searchtype} like '%${searchinput}%' </if>"
	         + "<if test='no != null '> and h.no = #{no} and open = 0 </if>"
	         + "</where>"
			+ " GROUP BY h.wno "
			+ "<if test='searchsort != null '> order by ${searchsort} desc </if> "
			 + " limit #{num} , #{limit}  "
			+ "</script>"})
	List<TIL> getHashTillist(Map<String, Object> param);

}
