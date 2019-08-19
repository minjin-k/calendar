package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 1. �Ķ���� ������ Member ��ü�� ����
 * 2. Member ��ü�� db�� insert
 * 3. ��� ���� : loginForm.jsp ������ �̵�
 * 	    ��� ���� : joinForm.jsp ������ �̵�
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
