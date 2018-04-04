package service;

import java.io.File;
import java.io.IOException;
import java.rmi.ServerException;
import java.util.Enumeration;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.Member;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServerException, IOException {
		
		String savePath = request.getServletContext().getRealPath("/Profileimg/");
		int sizeLimit = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
			try {
			System.out.println("---------- JoinAction Start ----------");
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			
			member.setId(multi.getParameter("id"));
			member.setPassword(multi.getParameter("password"));
			member.setName(multi.getParameter("name"));
			member.setBirth(multi.getParameter("birth"));
			member.setImage(multi.getParameter("image"));
			System.out.println(member.getImage());
			member.setSex(multi.getParameter("sex"));
			member.setAddress(multi.getParameter("address"));
			member.setEmail(multi.getParameter("email"));
			member.setTel(multi.getParameter("tel"));
			member.setIntro(multi.getParameter("intro"));
			
			MemberDAO md = MemberDAO.getInstance();
			int result = md.join(member);
			if(result != 1)
				return "join.jsp";
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "joinComplete.jsp";
	}

}
