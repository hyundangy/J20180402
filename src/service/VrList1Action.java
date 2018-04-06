package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cafe;
import dao.CafeDAO;
import dao.Member;
import dao.MemberDAO;
import dao.Theme;

public class VrList1Action implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try{
			int cnum=0;
			cnum=Integer.parseInt(request.getParameter("cnum"));
			String id=request.getParameter("id");
			CafeDAO cd = CafeDAO.getInstance();
			Cafe cafe = cd.cafe_info(cnum);
			MemberDAO md=MemberDAO.getInstance();
			Member member=md.getUserInfo("jun");	//임의로 kang으로 설정
			
			List<Theme> list = cd.v_select_theme(cnum);
			request.setAttribute("list", list);
			request.setAttribute("cnum", cnum);
			request.setAttribute("cafe", cafe);
			request.setAttribute("member",member);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return "vrList1View.jsp";
	}

}
