package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ������ ������ ������ ó�����ִ� �߻�Ŭ���� �����
public abstract class AdminUserAction implements Action{
	protected String login;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"/alert.jsp");
		} else if(!login.equals("admin")) {
			request.setAttribute("msg", "�����ڸ� �����մϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"/alert.jsp");
		}
		return doExecute(request,response);
	}

	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
