package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
public class AcceptAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);

		if(dao.accept(id) < 1) { //승인완료
			mem.setAccept(1);
			request.setAttribute("msg", "승인완료.");
			request.setAttribute("url", "list.me");
		} else {
			request.setAttribute("msg", "승인오류 다시 시도하세요.");
			request.setAttribute("url", "list.me");
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
