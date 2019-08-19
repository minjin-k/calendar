package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
	- 일반사용자
		(1) 비밀번호 검증
		(2) - 비밀번호가 일치하면,
				DB에서 id에 해당하는 정보를 삭제.
					로그아웃  후, "탈퇴 성공" 메세지 출력. loginForm.jsp로 페이지 이동.
				DB에서 id에 해당하는 정보 삭제실패.
					"삭제 실패"메세지 출력. main.jsp로 페이지 이동
			- 비밀번호가 불일치하면,
				"비밀번호 불일치" 메세지 출력. deletForm.jsp로 페이지 이동
	- 관리자
		(1) db에서 해당 id정보를 삭제.
				- DB에서 id에 해당하는 정보 삭제실패.
					"삭제 실패"메세지 출력. list.jsp로 페이지 이동
		(2) "탈퇴 성공" 메세지 출력. list.jsp로 페이지 이동
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴 불가능합니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		
		if(login.equals("admin") || pass.equals(mem.getPass())) {
			if(dao.delete(id) > 0) { //삭제완료
				request.setAttribute("msg", "탈퇴성공.");
				if(login.equals("admin")) {
					request.setAttribute("url", "list.me");						
				} else {
					request.setAttribute("url", "loginForm.me");
					request.getSession().invalidate();
				}
			} else { //삭제 실패
				request.setAttribute("msg", "탈퇴 실패.");
				if(id.equals("admin")) {
					request.setAttribute("url", "list.me");
				} else {
					request.setAttribute("url", "deleteForm.me?id=" + id);
				}
			}
		} else {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "deleteForm.me?id=" + id);
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
