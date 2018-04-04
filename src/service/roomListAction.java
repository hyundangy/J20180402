package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cafe;
import dao.CafeDAO;
import dao.Theme;

public class roomListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		CafeDAO cd = CafeDAO.getInstance();

		try{
			int cnum=0;
			cnum=Integer.parseInt(request.getParameter("cnum"));
			List<Theme> list = cd.r_select_theme(cnum);
			
			Cafe cafe = cd.r_list3(cnum);
			request.setAttribute("list", list);
			request.setAttribute("cnum", cnum);
			request.setAttribute("cafe", cafe);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return "roomListView.jsp";
	}

}
