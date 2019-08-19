package mapper;

import java.util.Map;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	
	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert into board"
			+ "(num,id,code,name,subject,content,file1,regdate,readcnt,comcnt,ref,reflevel,refstep)"
			+ "values (#{num},#{id},#{code},#{name},#{subject},#{content},#{file1},now(),0,0,#{ref},#{reflevel},#{refstep})")
	boolean insert(Board board);
	
	@Select("select count(*) from board where code= #{code}")
	int boardCount();
	
	@Update("update board set readcnt = readcnt + 1 where num = #{num}")
	void readcntadd(int num);
	
	@Update("update board set refstep = refstep + 1 where ref = #{ref} and refstep > #{refstep}")
	void refstepadd(Map<String, Object> map);
	
	@Update("update board set name=#{name},subject=#{subject},content=#{content},file1=#{file1} where num = #{num}")
	boolean update(Board board);
	
	@Delete("delete from board where num = #{num} ")
	boolean delete(int num);

	@Update("update board set comcnt=#{comcnt} where num=#{num}")
	int comcnt(Map<String, Object> map);	
	
	
	
}
