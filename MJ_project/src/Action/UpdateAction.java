package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
	update.me 기능
	1. 모든 파라미터를 Member 객체에 저장
	2. 비밀번호 검증
		- 비밀번호 일치	 : db수정
			수정성공	: 수정 성공 메세지 출력. main.me로 페이지 이동
			수정실패	: 수정 실패 메세지 출력. updateForm.me로 페이지 이동
 */
public class UpdateAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setMajor(request.getParameter("major"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setNick(request.getParameter("nick"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		MemberDao dao = new MemberDao();
		String msg = null;
		String url = null;
		String login = (String)request.getSession().getAttribute("login");
		if(login.equals("admin")) {
			if(dao.update(mem) > 0) {
				msg = "수정완료.";
				url = "list.me";
			} else {
				msg = "수정실패.";
				url = "updateForm.me?id=" + id;
			}
		} else {
			if(dao.update(mem) > 0) {
				msg = "수정완료.";
				url = "info.me?id=" + id;
			} else {
				msg = "수정실패.";
				url = "updateForm.me?id=" + id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
}
