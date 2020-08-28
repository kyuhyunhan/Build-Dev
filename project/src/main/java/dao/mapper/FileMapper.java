package dao.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.UserFile;

public interface FileMapper {

	@Insert("insert into file (no, wno, fno, name, filename, fileurl, regdate) values(#{no},#{wno},#{fno},#{name},#{filename},#{fileurl},now())")
	void insert_file(UserFile f);

	@Update("update file set filename = #{filename}, fileurl= #{fileurl}, regdate = now() where no=#{no} and wno=#{wno} and fno=#{fno}")
	void update_file(UserFile f);

}
