package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Goodorbad;

public interface BoardMapper {

	
	@Select("select ifnull(max(bno),0) from board where no=#{no}")
	int maxnum(int no);

	@Insert("insert into board (no,bno,name,title,content,regdate) "
			+ "values (#{no},#{bno},#{name},#{title},#{content},now() )")
	void insert(Board board);

	
	@Select({"<script> "
			+ "select count(*) from board "
			+ "<if test='searchtype != null and searchcontent != null '> where ${searchtype} like '%${searchcontent}%' and no=${no} </if>"
			+ "<if test='searchtype == null and searchcontent == null '> where no=${no} </if>"
			+ "</script>"})
	int count(Map<String, Object> param);

	
	@Select({"<script>"
			+ "SELECT b.no NO, bno, NAME, title, content, regdate, point FROM board b LEFT JOIN (SELECT NO, wno, IFNULL(COUNT(wno),0) point FROM goodorbad WHERE NO = #{no} GROUP BY wno) g ON  g.no = b.no AND bno = wno  "
			+ "<if test='searchtype == null and searchcontent == null'> where b.no= #{no} order by bno desc limit #{startrow} , #{limit} </if> "
			+ "<if test='searchtype != null and searchcontent != null'> where ${searchtype} like '%${searchcontent}%' and b.no = #{no} order by bno desc limit #{startrow} , #{limit}  </if> "
			+ "</script>"})
//	@Select({"<script>"
//			+ "select no, bno, name, title,"
//	         + "content, regdate, open "
//	         + " from board "
//	         + "<if test='searchtype != null and searchcontent != null'> where ${searchtype} like #{searchcontent} </if>"
//	         + "<if test='searchtype == null and searchcontent == null'> where no=#{no} </if>"
//	         +" where no = #{no} order by bno desc limit #{startrow} , #{limit} "
//			+ "</script>"})
	List<Board> list(Map<String, Object> param);

	
	@Select("select *  from board "
			+ "where bno = #{bno} and no=#{no} ")
	Board detail(Map<String, Object> param);

	@Update("update board set readcnt = (readcnt+1) where num= #{num} ")
	void readcnt(Map<String, Object> param);

	@Update("update board set grpstep = grpstep +1 where grp = :grp and grpstep > #{grpstep} ")
	void updateGrpStep(Map<String, Object> param);

	@Update("update board set name= #{name}, title= #{title}, content= #{content}   where no= #{no} and bno=${bno}")
	void update(Board board);
	
	@Delete("delete from board where bno= #{bno} and no=#{no}")
	void delete(Board board);
	
	@Select("select name , count(*) cnt from board group by name order by cnt desc LIMIT 0,7")
	List<Map<String, Object>> graph1();

	@Select("select DATE_FORMAT(regdate,'%Y-%m-%d') date , count(*) cnt from board group by DATE_FORMAT(regdate,'%Y-%m-%d') order by cnt desc LIMIT 0,7")
	List<Map<String, Object>> graph2();

	
	
	
	@Insert("insert into goodorbad (no,wno,gno,name,regdate) values (#{no},#{bno},#{gno},#{name},now()) ")
	void likeit(Map<String, Object> param);

	
//	@Insert("insert into board (no,bno,name,title,content,regdate) "
//			+ "values (#{no},#{bno},#{name},#{title},#{content},now() )")
//	void insert(Board board);
	
	
	@Select("select ifnull(max(gno),0) from goodorbad where NO=#{no} AND wno=#{bno}")
	int maxgno(Map<String, Object> param);

	@Select("select ifnull(max(gno),0) from goodorbad where NO=#{no} AND wno=#{bno} and name = #{name}")
	int likechk(Map<String, Object> param);

	
	
	@Select({"<script>"
			+ "select * "
	         + " from goodorbad "
	         +" where no = #{no} order by bno desc limit #{startrow} , #{limit} "
			+ "</script>"})
	List<Goodorbad> goodorbadlist(Map<String, Object> param);

	
	@Select("SELECT IFNULL(COUNT(*),0) FROM goodorbad WHERE NO=#{no} AND wno=#{bno}")
	int getpoint(Map<String, Object> param);

	@Select("SELECT b.no NO, bno, NAME, title, content, regdate, IFNULL(tot,0) point FROM board b "
			+ "LEFT JOIN (SELECT NO, wno, IFNULL(COUNT(wno),0) tot FROM goodorbad WHERE NO = no GROUP BY wno) g ON  g.no = b.no AND bno = wno "
			+ "where b.no= #{no} order by point desc limit #{num} , #{limit}")
	List<Board> getCommunitylist(Map<String, Object> param);

	@Select("SELECT * from board where no= #{no} order by bno desc limit 0 , #{limit} ")
	List<Board> list2(Map<String, Object> param);
	
	@Delete("delete from goodorbad where wno= #{bno} and no=#{no}")
	void goodorbadDelete(Board board);


	@Delete("delete from reply where bno= #{bno} and no=#{no}")
	void replyListDelete(Board board);
}
