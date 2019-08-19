package Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class SearchAction extends AdminUserAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// column, find 파라미터 저장하기
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		MemberDao dao = new MemberDao();
		List<Member> list = dao.searchlist(column,find);
		request.setAttribute("list",list);
		return new ActionForward(false,"list.jsp");
	}
	
}
