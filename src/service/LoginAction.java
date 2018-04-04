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
			MemberDAO member = MemberDAO.getInstance();
			int result = member.login(id, password);
			request.setAttribute("id", id);
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
