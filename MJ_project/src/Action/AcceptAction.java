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

		if(dao.accept(id) < 1) { //���οϷ�
			mem.setAccept(1);
			request.setAttribute("msg", "���οϷ�.");
			request.setAttribute("url", "list.me");
		} else {
			request.setAttribute("msg", "���ο��� �ٽ� �õ��ϼ���.");
			request.setAttribute("url", "list.me");
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
