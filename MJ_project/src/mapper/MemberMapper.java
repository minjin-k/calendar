package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	
	@Insert("insert into member"
			+ "(id, major, pass, name, nick, tel, picture, accept)"
			+ " values (#{id}, #{major}, #{pass}, #{name}, #{nick}, #{tel}, #{picture}, 0)")
	int insert(Member mem);
	
	@Update("update member set name=#{name},pass=#{pass},tel=#{tel},"
			+"nick=#{nick},major=#{major},picture=#{picture} where id=#{id}")
	int update(Member mem);
	
	@Update("update member set pass=#{pass} where id=#{id}")
	int updatePass(Map<String, Object> map);

	@Delete("delete from member where id=#{id}")
	int delete(String id);

	@Update("update member set accept=accept+1 where id=#{id}")
	int accept(String id);
	
}
