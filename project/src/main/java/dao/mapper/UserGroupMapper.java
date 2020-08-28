package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Usergroup;

public interface UserGroupMapper {

	@Insert("INSERT INTO user_group(name, gno, lang, chk, auth, comment) "
			+ "VALUES(#{name}, #{gno}, #{lang}, '신청', '회원', #{comment})")
	void join(Map<String, Object> param);

	@Select({"<script>",
		"select user.NAME name, gno, user_group.auth, lang, chk, COMMENT, email, phone from user_group LEFT JOIN user ON user_group.name = user.name",
		"<if test='gno != null'> where gno=#{gno} and user_group.auth = '멤버' and chk = '승인'</if>",
		"</script>"})
	List<Usergroup> getMemberList(Object object);

	@Insert("INSERT INTO user_group(name, gno, chk, auth) "
			+ "VALUES(#{name}, #{gno}, '승인', '팀장')")
	void ugroupJoinMaster(Map<String, Object> param);

	@Select({"<script>",
		"select user.NAME name, gno, user_group.auth, lang, chk, COMMENT, email, phone from user_group LEFT JOIN user ON user_group.name = user.name",
		"<if test='gno != null'> where gno=#{gno} and user_group.auth = '회원' and chk = '신청'</if>",
		"</script>"})
	List<Usergroup> getApplyList(Map<String, Object> param);

	@Update("UPDATE user_group SET chk = '승인', auth = '멤버' WHERE NAME = #{name}")
	void accept(Map<String, Object> param);

	@Delete("DELETE FROM user_group WHERE NAME = #{name} AND gno = #{gno}")
	void deport(Map<String, Object> param);

	@Select({"<script>",
		"select user.NAME name, gno, user_group.auth, lang, chk, COMMENT, email, phone from user_group LEFT JOIN user ON user_group.name = user.name",
		"<if test='gno != null'> where gno=#{gno} and chk = '승인'</if>",
		"</script>"})
	List<Usergroup> getMember(Map<String, Object> param);

	@Select("select COUNT(*) from user_group LEFT JOIN user ON user_group.name = user.name " + 
			"where gno=#{gno} and chk = '승인'")
	int getMembercount(Map<String, Object> param);

	@Select("SELECT maxnum FROM working WHERE gno = #{gno}")
	int getMembermax(Map<String, Object> param);

	@Select("SELECT NAME FROM user_group WHERE gno = #{gno} AND auth = '팀장'")
	String getMembermaset(Map<String, Object> param);

	@Select("select chk from user_group where gno = #{gno} and name = #{name}")
	String getChk(Map<String, Object> param);


}
