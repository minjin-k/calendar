package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	1. session�� ��ϵ� �α��� ���� ����.
	2. 'id'�� �α׾ƿ��Ǿ����ϴ�. �޼��� ��� �� 
	   loginForm.jsp�� ������ �̵��ϱ�.
 */
public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		request.getSession().invalidate();
		
		String msg = login + "�� �α׾ƿ��Ǿ����ϴ�.";
		String url = "loginForm.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
