package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cafe;
import dao.CafeDAO;
import dao.Theme;

public class VrReserveAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		CafeDAO cd = CafeDAO.getInstance();
		try{
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			int tnum = Integer.parseInt(request.getParameter("tnum"));
			
			
			Cafe cafe = cd.cafe_info(cnum);
			Theme theme = cd.v_theme(cnum,tnum);
			
			request.setAttribute("cnum", cnum);
			request.setAttribute("tnum", tnum);
			request.setAttribute("cafe", cafe);
			request.setAttribute("theme", theme);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return "vrReserveView.jsp";
	}

}
