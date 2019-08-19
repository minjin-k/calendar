package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
	update.me ���
	1. ��� �Ķ���͸� Member ��ü�� ����
	2. ��й�ȣ ����
		- ��й�ȣ ��ġ	 : db����
			��������	: ���� ���� �޼��� ���. main.me�� ������ �̵�
			��������	: ���� ���� �޼��� ���. updateForm.me�� ������ �̵�
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
				msg = "�����Ϸ�.";
				url = "list.me";
			} else {
				msg = "��������.";
				url = "updateForm.me?id=" + id;
			}
		} else {
			if(dao.update(mem) > 0) {
				msg = "�����Ϸ�.";
				url = "info.me?id=" + id;
			} else {
				msg = "��������.";
				url = "updateForm.me?id=" + id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
}
