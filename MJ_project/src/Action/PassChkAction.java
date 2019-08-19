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
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "loginForm.me");
			request.setAttribute("closable", true);
			return new ActionForward(false,"../alert.jsp");
		}
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		String id = request.getParameter("id");
		if(login.equals("admin")) {
			request.setAttribute("msg", "관리자의 권한으로 수정합니다.");
			request.setAttribute("url", "updateForm.me?id=" + id);
		} else {
			if(pass.equals(mem.getPass())) {
				request.setAttribute("msg", "비밀번호는 주기적으로 변경해주세요.");
				request.setAttribute("url", "updateForm.me?id=" + login);
			} else {
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
				request.setAttribute("url", "passchkForm.me?id=" + login);
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
