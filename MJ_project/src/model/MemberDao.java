package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;

public class MemberDao {
	private static final String ns="mapper.MemberMapper.";
	Map<String,Object> map = new HashMap<String, Object>();
	//mem : 화면에 입력된 정보 저장 객체
	public int insert(Member mem) {
		SqlSession session = DBconnection.getConnecttion(); 
		try {
			return session.getMapper(MemberMapper.class).insert(mem); // 등록성공시 1값 리턴
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}
	public Member selectOne(String id) {								
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("id", id);
			return session.selectOne(ns + "select",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public int update (Member mem) {
		//id, pass 는 변경 안됨.
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}
	public int updatePass(String id, String pass) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("pass", pass);
			map.put("id", id);
			return session.getMapper(MemberMapper.class).updatePass(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}
	public List<Member> list() {
		SqlSession session = DBconnection.getConnecttion();
		List<Member> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return list;
	}
	public int delete(String id) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(MemberMapper.class).delete(id);
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}
	public List<Member> searchlist(String column, String find) {
		SqlSession session = DBconnection.getConnecttion();
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;
		map.clear();
		map.put("column", column);
		map.put("find", find);
		try {
			return session.selectList(ns + "select",map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public int accept(String id) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(MemberMapper.class).accept(id);
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0 ;
	}
}
