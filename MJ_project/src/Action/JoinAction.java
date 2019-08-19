package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 1. 파라미터 정보를 Member 객체에 저장
 * 2. Member 객체를 db에 insert
 * 3. 등록 성공 : loginForm.jsp 페이지 이동
 * 	    등록 실패 : joinForm.jsp 페이지 이동
 */
public class JoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setMajor(request.getParameter("major"));
		mem.setPass(request.getParameter("pass"));
		mem.setRepass(request.getParameter("repass"));
		mem.setName(request.getParameter("name"));
		mem.setNick(request.getParameter("nick"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		
		
		if(new MemberDao().insert(mem)>0) {
			return new ActionForward(true,"loginForm.jsp");
		} else {
				return new ActionForward(true,"joinForm.jsp");
		}
	}
}
