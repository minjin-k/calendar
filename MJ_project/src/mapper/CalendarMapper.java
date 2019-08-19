package mapper;



import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Calendar;

public interface CalendarMapper {

	@Insert("insert into calendar"
			+ "(no,id,s_date,e_date,major,subject,content)"
			+ "values (#{no},#{id},#{s_date},#{e_date},#{major},#{subject},#{content})")
	boolean insert(Calendar calendar);
	
	@Update("update calendar set s_date=#{s_date},e_date=#{e_date},major=#{major},subject=#{subject},content=#{content} where no = #{no}")
	boolean update(Map<String, Object> map);

	@Select("select ifnull(max(no),0) from calendar")
	int maxno();

	@Select("select subject from calendar where no = #{no}")
	String title(Map<String, Object> map);

	@Select("select s_date from calendar where no = #{no}")
	String start(Map<String, Object> map);

	@Select("select e_date from calendar where no = #{no}")
	String end(Map<String, Object> map);

	@Select("select major from calendar where no = #{no}")
	String major(Map<String, Object> map);
	
	@Select("select content from calendar where no = #{no}")
	String content(Map<String, Object> map);

	@Select("select major from calendar where s_date = #{s_date} and e_date = #{e_date} and subject = #{subject} ")
	String major2(Map<String, Object> map);

	@Select("select content from calendar where s_date = #{s_date} and e_date = #{e_date} and subject = #{subject} ")
	String content2(Map<String, Object> map);

	@Select("select no from calendar where s_date = #{s_date} and e_date = #{e_date} and subject = #{subject} ")
	int no(Map<String, Object> map);

	@Delete("delete from calendar where no = #{no} ")
	boolean delete(int no);

	
}
