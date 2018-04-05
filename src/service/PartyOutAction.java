package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PartyDAO;

public class PartyOutAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try{
			request.setCharacterEncoding("utf-8");
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			String id = request.getParameter("id");
			String pageNum = request.getParameter("pageNum");
			PartyDAO pd = PartyDAO.getInstance();
			int result = pd.partyOut(pnum,id);
			request.setAttribute("pnum", pnum);
			request.setAttribute("id", id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "partyOut.jsp";
	}
}
