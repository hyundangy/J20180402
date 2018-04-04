package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDAO;
import dao.Cafe;

public class SearchGpsAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CafeDAO cd = CafeDAO.getInstance();
		String keyword = "서울";
		
		try {
			List<Cafe> cslist = cd.searchCafelist(keyword);
			request.setAttribute("cslist", cslist);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "searchgps.jsp";
	}

}
