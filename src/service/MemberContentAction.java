package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.Member;

public class MemberContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			String pageNum = request.getParameter("pageNum");
			MemberDAO md = MemberDAO.getInstance();
			Member member = md.memberSelect(id);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "memberContent.jsp";
	}

}
