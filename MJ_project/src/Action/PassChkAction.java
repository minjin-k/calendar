package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
public class PassChkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
			request.setAttribute("url", "loginForm.me");
			request.setAttribute("closable", true);
			return new ActionForward(false,"../alert.jsp");
		}
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		String id = request.getParameter("id");
		if(login.equals("admin")) {
			request.setAttribute("msg", "�������� �������� �����մϴ�.");
			request.setAttribute("url", "updateForm.me?id=" + id);
		} else {
			if(pass.equals(mem.getPass())) {
				request.setAttribute("msg", "��й�ȣ�� �ֱ������� �������ּ���.");
				request.setAttribute("url", "updateForm.me?id=" + login);
			} else {
				request.setAttribute("msg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				request.setAttribute("url", "passchkForm.me?id=" + login);
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
