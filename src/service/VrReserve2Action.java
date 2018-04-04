package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDAO;
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
			
			request.setAttribute("cnum", cnum);
			request.setAttribute("tnum", tnum);
			request.setAttribute("theme", theme);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		
		return "vrReserve2View.jsp";
	}

}
