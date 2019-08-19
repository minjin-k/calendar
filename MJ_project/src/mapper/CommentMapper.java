package mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.comment;

public interface CommentMapper {
	
	@Select("select ifnull(max(no),0) from comment")
	int maxno();

	@Insert("insert into comment"
			+ "(no,num,id,code,name,content,regdate,ref,reflevel,refstep)"
			+ "values (#{no},#{num},#{id},#{code},#{name},#{content},now(),#{ref},#{reflevel},#{refstep})")
	boolean insert(comment comment);
	
	@Select("select count(*) from comment where num=#{num}")
	int commentCount();
	
	@Update("update comment set refstep = refstep + 1 where ref = #{ref} and refstep > #{refstep}")
	void refstepadd(Map<String, Object> map);
	
	@Update("update comment set name=#{name},content=#{content} where no = #{no}")
	boolean update(comment comment);
	
	@Delete("delete from comment where no = #{no} ")
	boolean delete(int no);
	
	@Select("select * from comment where code=#{code} and num=#{num}")
	void selectCode(int code, int num);

}
