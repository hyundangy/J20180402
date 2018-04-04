package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDAO;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			try {
				request.setCharacterEncoding("utf-8");
				int bnum = Integer.parseInt(request.getParameter("bnum"));
				String id = request.getParameter("id");
				String pageNum = request.getParameter("pageNum");
				BoardDAO bdPro = BoardDAO.getInstance();
				Board board = new Board();
				int result = bdPro.delete(bnum,id);

				request.setAttribute("result", result);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("bnum", bnum);
			} catch (Exception e) {
				System.out.println("�ù�");
				System.out.println(e.getMessage());
			}
		return "deletePro.jsp";
	}

}
