package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	1. session에 등록된 로그인 정보 제거.
	2. 'id'님 로그아웃되었습니다. 메세지 출력 후 
	   loginForm.jsp로 페이지 이동하기.
 */
public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");
		request.getSession().invalidate();
		
		String msg = login + "님 로그아웃되었습니다.";
		String url = "loginForm.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
