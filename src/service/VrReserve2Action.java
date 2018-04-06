package service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cafe;
import dao.CafeDAO;
import dao.Member;
import dao.Reservation;
import dao.Theme;

public class VrReserve2Action implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try{
			CafeDAO cd = CafeDAO.getInstance();
			int tnum=Integer.parseInt(request.getParameter("tnum"));
			int cnum=Integer.parseInt(request.getParameter("cnum"));
			Theme theme = cd.v_theme(cnum,tnum);
			Cafe cafe = cd.cafe_info(cnum);
			Member member=cd.member_into("bbb");
			request.setAttribute("cnum", cnum);
			request.setAttribute("tnum", tnum);
			request.setAttribute("theme", theme);
			request.setAttribute("cafe", cafe);
			request.setAttribute("member", member);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		
		return "vrReserve2View.jsp";
	}

}
