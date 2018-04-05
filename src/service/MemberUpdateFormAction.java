package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDAO;

public class MemberUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String pageNum = request.getParameter("pageNum");
			MemberDAO md = MemberDAO.getInstance();
			Member member = md.getUserInfo(id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("member", member);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "memberUpdateForm.jsp";
	}

}
