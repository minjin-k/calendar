package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.CalendarMapper;

public class CalendarDao {
	private static final String ns="mapper.CalendarMapper.";
	Map<String,Object> map = new HashMap<String,Object>();
	public int maxno() {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(CalendarMapper.class).maxno();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return -1;
	}
	public String title(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.getMapper(CalendarMapper.class).title(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String start(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.getMapper(CalendarMapper.class).start(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String end(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.getMapper(CalendarMapper.class).end(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String major(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.getMapper(CalendarMapper.class).major(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String content(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.getMapper(CalendarMapper.class).content(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String major2(String s_date,String e_date,String subject) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("s_date", s_date);
			map.put("e_date", e_date);
			map.put("subject", subject);
			return session.getMapper(CalendarMapper.class).major2(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public boolean insert(Calendar calendar) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(CalendarMapper.class).insert(calendar);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	public boolean update(int no , String s_date, String e_date,String subject,String major,String content) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			map.put("s_date", s_date);
			map.put("e_date", e_date);
			map.put("subject", subject);
			map.put("major", major);
			map.put("content", content);
			return session.getMapper(CalendarMapper.class).update(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	public Calendar selectOne(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("no", no);
			return session.selectOne(ns + "select",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public String content2(String s_date, String e_date, String subject) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("s_date", s_date);
			map.put("e_date", e_date);
			map.put("subject", subject);
			return session.getMapper(CalendarMapper.class).content2(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public int no(String s_date, String e_date, String subject) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("s_date", s_date);
			map.put("e_date", e_date);
			map.put("subject", subject);
			return session.getMapper(CalendarMapper.class).no(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}
	public boolean delete(int no) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(CalendarMapper.class).delete(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	
}
