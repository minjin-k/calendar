package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;

public class BoardDao {
	private static final String ns="mapper.BoardMapper.";
	Map<String,Object> map = new HashMap<String,Object>();
	
	public int maxnum() {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(BoardMapper.class).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return -1;
	}
	public boolean insert(Board board) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			return session.getMapper(BoardMapper.class).insert(board);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	public int boardCount(String column , String find, int code) {
		SqlSession session = DBconnection.getConnecttion();
		String col1 = column;
		String col2 = null;
		try {
			if(column != null) {
				 String[] cols = column.split(",");
				 col1 = cols[0];
				 if(cols.length == 2) {
					 col2 = cols[1];
				 }
			}
			map.clear();
			map.put("column", col1);
			map.put("find", find);
			map.put("col2", col2);
			map.put("code", code);
			return session.selectOne(ns + "count", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 3;
	}

	public List<Board> list(int pageNum,int limit,String column, String find, int code) {
		SqlSession session = DBconnection.getConnecttion();
		String col1 = column;
		String col2 = null;
		try {
			if(column != null) {
				 String[] cols = column.split(",");
				 col1 = cols[0];
				 if(cols.length == 2) {
					 col2 = cols[1];
				 }
			}
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			map.put("column", col1);
			map.put("find", find);
			map.put("col2", col2);
			map.put("code", code);
			return session.selectList(ns + "select",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public Board selectOne(int num) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("num", num);
			return session.selectOne(ns + "select",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return null;
	}
	public void readcntadd(int num) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			session.getMapper(BoardMapper.class).readcntadd(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
	}

	public void refstepadd(int ref,int refstep) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("ref", ref);
			map.put("refstep", refstep);
			session.getMapper(BoardMapper.class).refstepadd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
	}
	
	public boolean update(Board board) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			session.getMapper(BoardMapper.class).update(board);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	public boolean delete(int num) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			session.getMapper(BoardMapper.class).delete(num);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return false;
	}
	public int comcnt(int num, int comcnt) {
		SqlSession session = DBconnection.getConnecttion();
		try {
			map.clear();
			map.put("num", num);
			map.put("comcnt", comcnt);
			return session.getMapper(BoardMapper.class).comcnt(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(session);
		}
		return 0;
	}

}
