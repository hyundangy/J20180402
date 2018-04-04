package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cafe;
import dao.CafeDAO;

public class roomMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		CafeDAO cd = CafeDAO.getInstance();
		try{
			List<Cafe> list = cd.r_list();
			request.setAttribute("list", list);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return "roomMainView.jsp";
	}

}
