package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDAO;

public class ReplyWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int bnum = 0, ref = 0, re_level = 1, readcount = 0;
			String category = "댓글";
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null)
				pageNum = "1";
			if(request.getParameter("bnum") != null){
				bnum = Integer.parseInt(request.getParameter("bnum"));
				BoardDAO bd = BoardDAO.getInstance();
				Board board = bd.select(bnum);
				ref= board.getRef();
				/*re_level = board.getRe_level();*/
			}
			request.setAttribute("bnum", bnum);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("readcount", readcount);
			request.setAttribute("category", category);
			
			System.out.println("re_level-->>"+re_level);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "replyWriteForm.jsp";
	}

}
