package Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
 * �α׸� ó��
 * 1. id , pass �Ķ���� ����.
 * 2. id ������ �Էµ� pass�� db�� ����� pass ��.
 * 		- id�� ���� ��� : ���̵� ���� �޽��� ���. loginForm.jsp ������ �̵�
 *		- id�� �ִ� ��� : 
 *				- ��й�ȣ ��ġ : �α��� ���� session ����
 *							   �޽��� ���. main.jsp ������ �̵�
 *				- ��й�ȣ ����ġ : ��й�ȣ ����ġ �޽��� ���. loginForm.jsp ������ �̵�
 */
public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		String msg = "�ش� ���̵� ����";
		String url = "loginForm.me";
		if(mem != null) {
			if(pass.equals(mem.getPass())) {
				msg = mem.getName() + "���� �α��� �߽��ϴ�.";
				url = "info.me?id="+id;
				request.getSession().setAttribute("login", id);
			}else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		} 
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
