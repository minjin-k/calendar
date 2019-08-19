package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
	- �Ϲݻ����
		(1) ��й�ȣ ����
		(2) - ��й�ȣ�� ��ġ�ϸ�,
				DB���� id�� �ش��ϴ� ������ ����.
					�α׾ƿ�  ��, "Ż�� ����" �޼��� ���. loginForm.jsp�� ������ �̵�.
				DB���� id�� �ش��ϴ� ���� ��������.
					"���� ����"�޼��� ���. main.jsp�� ������ �̵�
			- ��й�ȣ�� ����ġ�ϸ�,
				"��й�ȣ ����ġ" �޼��� ���. deletForm.jsp�� ������ �̵�
	- ������
		(1) db���� �ش� id������ ����.
				- DB���� id�� �ش��ϴ� ���� ��������.
					"���� ����"�޼��� ���. list.jsp�� ������ �̵�
		(2) "Ż�� ����" �޼��� ���. list.jsp�� ������ �̵�
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(id.equals("admin")) {
			request.setAttribute("msg", "�����ڴ� Ż�� �Ұ����մϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		
		if(login.equals("admin") || pass.equals(mem.getPass())) {
			if(dao.delete(id) > 0) { //�����Ϸ�
				request.setAttribute("msg", "Ż�𼺰�.");
				if(login.equals("admin")) {
					request.setAttribute("url", "list.me");						
				} else {
					request.setAttribute("url", "loginForm.me");
					request.getSession().invalidate();
				}
			} else { //���� ����
				request.setAttribute("msg", "Ż�� ����.");
				if(id.equals("admin")) {
					request.setAttribute("url", "list.me");
				} else {
					request.setAttribute("url", "deleteForm.me?id=" + id);
				}
			}
		} else {
			request.setAttribute("msg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			request.setAttribute("url", "deleteForm.me?id=" + id);
		}
		return new ActionForward(false,"../alert.jsp");
	}
}
