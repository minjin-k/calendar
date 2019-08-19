package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Board;
import model.BoardDao;
import model.Calendar;
import model.CalendarDao;
import model.Member;
import model.MemberDao;
import model.comment;
import model.commentDao;

public class AllAction {
	private BoardDao dao = new BoardDao();
	private commentDao cdao = new commentDao();
	private CalendarDao caldao = new CalendarDao();
	protected String login;

	public ActionForward hello(HttpServletRequest request, HttpServletResponse respinse) {
		request.setAttribute("hello", "Hello, world");
		return new ActionForward();
	}
	
	public ActionForward mainForm(HttpServletRequest request, HttpServletResponse respinse) {
		List<Map<String, String>> list1 = new ArrayList<Map<String, String>>();
		
		for(int i=1;i<=caldao.maxno();i++) {
			if(caldao.title(i) != null) {
			Map<String, String> map = new HashMap<String,String>();
			   map.put("title", caldao.title(i));
			   map.put("start", caldao.start(i));
			   map.put("end", caldao.end(i));
			   map.put("major", caldao.major(i));
			   map.put("content", caldao.content(i));
			   map.put("color", (caldao.major(i).equals("빅데이터개발"))?"#33CC33":
				   				(caldao.major(i).equals("네트워크"))?"#0099FF":
				   				(caldao.major(i).equals("스마트웹"))?"#9933FF":
				   				(caldao.major(i).equals("빅데이터"))?"#FFCC33":
				   				(caldao.major(i).equals("c샵"))?"#FF99CC":"#4641D9");
			   list1.add(map);
			}
		}
		request.setAttribute("list1", list1);
		return new ActionForward();
	}

	// 게시물 등록시 호출되는 메서드
	public ActionForward write(HttpServletRequest request, HttpServletResponse respinse) {
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		String id = request.getParameter("id");
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		try {
			multi = new MultipartRequest(request, path, 100 * 1024 * 1024, "euc-kr");
			Board b = new Board();
			b.setId(multi.getParameter("id"));
			b.setName(multi.getParameter("name"));
			int code = Integer.parseInt(multi.getParameter("code"));
			b.setCode(code);
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));
			int num = dao.maxnum();
			b.setNum(++num);
			b.setRef(num);
			if (dao.insert(b)) {
				request.setAttribute("msg", "게시물 등록 성공");
				request.setAttribute("url", "info.do?code=" + code +"&num=" + b.getNum());
			} else {
				request.setAttribute("msg", "게시물 등록 실패");
				request.setAttribute("url", "writeForm.do?code=" + code);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward writeCom(HttpServletRequest request, HttpServletResponse respinse) {

		comment c = new comment();
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		c.setNum(num);
		c.setId(request.getParameter("id"));
		c.setCode(request.getParameter("code"));
		c.setName("홍길동");
		c.setContent(request.getParameter("content"));
		int no = 0;
		no = cdao.maxno();
		c.setNo(++no);
		c.setRef(no);
		if (cdao.insert(c)) {
			request.setAttribute("msg", "댓글 등록 성공");
			request.setAttribute("url", "info.do?code=" + code + "&num=" + num);
		} else {
			request.setAttribute("msg", "댓글 등록 실패");
			request.setAttribute("url", "writeComForm.do?code=" + code + "&num=" + num);
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward list(HttpServletRequest request, HttpServletResponse respinse) {
		int pageNum = 1;
		int limit = 10;
		int code = Integer.parseInt(request.getParameter("code"));
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column != null && column.equals(""))
			column = null;
		if (find != null && find.equals(""))
			find = null;

		int boardcount = dao.boardCount(column, find, code);
		List<Board> list = dao.list(pageNum, limit, column, find, code);

		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("comcnt", 0);
		request.setAttribute("code", code);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount - ((pageNum - 1) * limit));
		return new ActionForward();
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse respinse) {
		login = (String)request.getSession().getAttribute("login");
		String code = request.getParameter("code");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "list.do?code="+code);	
			return new ActionForward(false,"../alert.jsp");
		}
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = dao.selectOne(num); // 게시물 조회
		request.setAttribute("b", board);
		dao.readcntadd(num);

		// 댓글기능
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column != null && column.equals(""))
			column = null;
		if (find != null && find.equals(""))
			find = null;

		int commentcount = cdao.commentCount(column, find, num, code);
		List<comment> list = cdao.list(pageNum, limit, column, find, num, code);
		dao.comcnt(num,commentcount);

		int maxpage = (int) ((double) commentcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("commentcount", commentcount);
		request.setAttribute("list", list);
		request.setAttribute("commentnum", commentcount - ((pageNum - 1) * limit));

		return new ActionForward();
	}

	public ActionForward boardDetail(HttpServletRequest request, HttpServletResponse respinse) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = dao.selectOne(num);
		request.setAttribute("b", board);
		return new ActionForward();
	}

	/*
	 * 1. 파라미터 정보들을 Board 객체에 저장. 2. 비밀번호 검증 비밀번호 일치 : 수정으로, 비밀번호 불일치 : 비밀번호 오류 메세지
	 * 출력하고, updateForm.do로 페이지 이동. 3. 수정성공 : 수정 성공 메세지 출력 후 list.do 페이지 이동 수정실패 :
	 * 수정 실패 메세지 출력 후 updateForm.do 페이지 이동
	 */
	public ActionForward update(HttpServletRequest request, HttpServletResponse respinse) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 100 * 1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			int code = Integer.parseInt(multi.getParameter("code"));
			board.setCode(code);
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			if (board.getFile1() == null || board.getFile1().equals("")) {
				board.setFile1(multi.getParameter("file2"));
			}

			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "updateForm.do?num=" + board.getNum());
			if (dao.update(board)) {
				request.setAttribute("msg", "게시물 수정 완료");
				request.setAttribute("url", "info.do?num=" + board.getNum());
			} else {
				request.setAttribute("msg", "게시물 수정 실패");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward updateCom(HttpServletRequest request, HttpServletResponse respinse) {
		comment comment = new comment();
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		try {
			comment.setNum(num);
			comment.setNo(Integer.parseInt(request.getParameter("no")));
			comment.setId(request.getParameter("id"));
			comment.setCode(code);
			comment.setName(request.getParameter("name"));
			comment.setContent(request.getParameter("content"));

			// request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			// request.setAttribute("url", "updateComForm.do?num=" + comment.getNum());
			if (cdao.update(comment)) {
				request.setAttribute("msg", "댓글 수정 완료");
				request.setAttribute("url", "info.do?code=" + code + "&num=" + num);
			} else {
				request.setAttribute("msg", "댓글 수정 실패");
				request.setAttribute("url", "updateComForm.do?no=" + num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1. num,pass 파라미터를 변수에 저장 2. 입력된 비밀번호와 db 비밀번호 검증 비밀번호가 일치하지 않는 경우 : 비밀번호 오류
	 * 메세지 출력, deleteForm.do 페이지로 이동 3. 게시물 삭제. 삭제 성공 : 삭제 성공 메세지 출력, list.do 페이지 이동
	 * 삭제 실패 : 삭제 실패 메세지 출력, info.do 페이지 이동
	 */
	public ActionForward delete(HttpServletRequest request, HttpServletResponse respinse) {
		int num = Integer.parseInt(request.getParameter("num"));
		int code = Integer.parseInt(request.getParameter("code"));
		try {
			request.setAttribute("msg", "게시물을 삭제하시겠습니까?");
			request.setAttribute("url", "delete.jsp");
			if (dao.delete(num)) {
				request.setAttribute("msg", "게시물 삭제 완료");
				request.setAttribute("url", "list.do?code=" + code);
			} else {
				request.setAttribute("msg", "게시물 삭제 실패");
				request.setAttribute("url", "info.do?num=" + num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1. 파라미터 값을 Board 객체에 저장하기 원글 정보 : num, ref , reflevel, refstep 답글 정보 : name,
	 * pass, subject, content 2. 같은 ref 값을 사용하는 게시물들의 refstep 값을 1 증가 시키기 3. Board
	 * 객체를 db에 insert하기. 4. 등록 성공시 : "답변 등록 완료" 메세지 출력. list.do로 이동. 등록 실패시 :
	 * "답변 등록 오류" 메세지 출력. replyForm.do로 이동.
	 */
	public ActionForward reply(HttpServletRequest request, HttpServletResponse respinse) {
		Board board = new Board();
		board.setId(request.getParameter("id"));
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setReflevel(Integer.parseInt(request.getParameter("reflevel")));
		board.setRefstep(Integer.parseInt(request.getParameter("refstep")));
		board.setName(request.getParameter("name"));
		board.setCode(Integer.parseInt(request.getParameter("code")));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		request.setAttribute("msg", "답변등록 실패");
		request.setAttribute("url", "replyForm.do?num=" + board.getNum());

		dao.refstepadd(board.getRef(), board.getRefstep());
		int num = dao.maxnum();
		board.setNum(++num);
		board.setReflevel(board.getReflevel() + 1);
		board.setRefstep(board.getRefstep() + 1);
		if (dao.insert(board)) {
			request.setAttribute("msg", "답변등록 성공");
			request.setAttribute("url", "info.do?num=" + board.getNum());
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward replyCom(HttpServletRequest request, HttpServletResponse respinse) {
		comment c = new comment();
		int num = Integer.parseInt(request.getParameter("num"));
		int no = Integer.parseInt(request.getParameter("no"));
		String code = request.getParameter("code");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int reflevel = Integer.parseInt(request.getParameter("reflevel"));
		int refstep = Integer.parseInt(request.getParameter("refstep"));

		c.setId(request.getParameter("id"));
		c.setNo(no);
		c.setNum(num);
		c.setRef(ref);
		c.setReflevel(reflevel);
		c.setRefstep(refstep);
		c.setCode(request.getParameter("code"));
		c.setName(request.getParameter("name"));
		c.setContent(request.getParameter("content"));

		request.setAttribute("msg", "답 댓글등록 실패");
		request.setAttribute("url", "replyComForm.do?no=" + no + "&num=" + num + "&ref=" + ref + "&reflevel=" + reflevel
				+ "&refstep=" + refstep + "&code=" + code);

		cdao.refstepadd(c.getRef(), c.getRefstep());
		no = cdao.maxno();
		c.setNo(++no);
		c.setReflevel(c.getReflevel() + 1);
		c.setRefstep(c.getRefstep() + 1);
		if (cdao.insert(c)) {
			request.setAttribute("msg", "답 댓글등록 성공");
			request.setAttribute("url", "info.do?code=" + code + "&num=" + num);
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward comment(HttpServletRequest request, HttpServletResponse respinse) {
		comment c = new comment();
		c.setNum(Integer.parseInt(request.getParameter("num")));
		c.setId(request.getParameter("id"));
		c.setName(request.getParameter("name"));
		c.setContent(request.getParameter("content"));
		c.setRef(Integer.parseInt(request.getParameter("ref")));
		c.setReflevel(Integer.parseInt(request.getParameter("reflevel")));
		c.setRefstep(Integer.parseInt(request.getParameter("refstep")));

		request.setAttribute("msg", "답변등록 실패");
		request.setAttribute("url", "replyForm.do?num=" + c.getNum());

		dao.refstepadd(c.getRef(), c.getRefstep());
		int num = dao.maxnum();
		c.setNum(++num);
		c.setReflevel(c.getReflevel() + 1);
		c.setRefstep(c.getRefstep() + 1);
		if (cdao.insert(c)) {
			request.setAttribute("msg", "답변등록 성공");
			request.setAttribute("url", "list.do");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward deleteCom(HttpServletRequest request, HttpServletResponse respinse) {
		int no = Integer.parseInt(request.getParameter("no"));
		int num = Integer.parseInt(request.getParameter("num"));
		try {
			if (cdao.delete(no)) {
				request.setAttribute("msg", "댓글 삭제 완료");
				request.setAttribute("url", "info.do?num=" + num);
			} else {
				request.setAttribute("msg", "댓글 삭제 오류");
				request.setAttribute("url", "info.do?num=" + num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	// Calendar
	public ActionForward addCal(HttpServletRequest request, HttpServletResponse respinse) {
		String id = request.getParameter("id");
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		try {
			Calendar cal = new Calendar();
			cal.setId(request.getParameter("id"));
			String s_date = request.getParameter("s_date");
			String e_date = request.getParameter("e_date");
			cal.setS_date(s_date);
			cal.setE_date(e_date);
			cal.setMajor(request.getParameter("major"));
			cal.setSubject(request.getParameter("subject"));
			cal.setContent(request.getParameter("content"));

			int no = caldao.maxno();
			cal.setNo(++no);
			if (caldao.insert(cal)) {
				request.setAttribute("msg", "일정 등록 성공");				
				request.setAttribute("url", "mainForm.do");
				request.setAttribute("closable", true);
			} else {
				request.setAttribute("msg", "일정 등록 실패");
				request.setAttribute("url", "addCalForm.do?s_date=" + s_date + "&e_date=" + e_date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward infoCal(HttpServletRequest request, HttpServletResponse respinse) {
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		String title = request.getParameter("title");
		String major = caldao.major2(s_date, e_date, title);
		String content = caldao.content2(s_date, e_date, title);
		int no = caldao.no(s_date, e_date, title);
		
		return new ActionForward(false, "infoCalForm.do?no="+no+"&s_date="+s_date+"&e_date="+e_date+"&title="+title+
				"&major="+ major +"&content="+content);
	}
	public ActionForward updateCal(HttpServletRequest request, HttpServletResponse respinse) {
		try {

			Calendar cal = new Calendar();
			int no = Integer.parseInt(request.getParameter("no"));
			String s_date = request.getParameter("s_date");
			String e_date = request.getParameter("e_date");
			String major = request.getParameter("major");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			cal.setS_date(s_date);
			cal.setE_date(e_date);
			cal.setMajor(major);
			cal.setSubject(subject);
			cal.setContent(content);

			if (caldao.update(no ,s_date,e_date,subject,major,content)) {
				request.setAttribute("msg", "일정 수정 성공");				
				request.setAttribute("url", "mainForm.do");
				request.setAttribute("closable", true);
			} else {
				request.setAttribute("msg", "일정 수정 실패");
				request.setAttribute("url", "updateCalForm.do?no=53&s_date="+s_date+"&e_date="+e_date+"&major="+major+"&title="+subject+"&content="+content);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward deleteCal(HttpServletRequest request, HttpServletResponse respinse) {
		int no = Integer.parseInt(request.getParameter("no"));
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		String subject = request.getParameter("subject");
			
		try {
			request.setAttribute("msg", "게시물을 삭제하시겠습니까?");
			request.setAttribute("url", "delete.jsp");
			if (caldao.delete(no)) {
				request.setAttribute("msg", "일정 삭제 완료");
				request.setAttribute("url", "mainForm.do");
				request.setAttribute("closable", true);
			} else {
				request.setAttribute("msg", "일정 삭제 실패");
				request.setAttribute("url", "updateCalForm.do?no="+no+"&s_date=" + s_date + "&e_date=" + e_date+"&title="+subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
}