package service;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.Member;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServerException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			MemberDAO md = MemberDAO.getInstance();
			Member member = new Member();
			// 회원정보 가져오는 DAO메소드
			member = md.getUserInfo(id);
			
			// 로그인기능 메소드
			int result = md.login(id, password);
			request.setAttribute("id", id);
			request.setAttribute("name", member.getName());
			request.setAttribute("admin", member.getAdmin());
			request.setAttribute("password", password);
			request.setAttribute("result", result);
			if(result == 1)
				return "main.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "login.jsp";
		
	}

}
