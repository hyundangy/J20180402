package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDAO;

public class ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			try {
				int bnum = Integer.parseInt(request.getParameter("bnum"));
				int ref = Integer.parseInt(request.getParameter("ref"));
				String pageNum = request.getParameter("pageNum");
				BoardDAO bd = BoardDAO.getInstance();
				bd.readCount(bnum);
				Board board = bd.select(bnum);
				
				int totCnt = bd.getTotalCnt();						//��ü ROW ����
				if (pageNum == null || pageNum.equals("")) {
					pageNum = "1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int pageSize = 10, blockSize = 10;
				int startRow = (currentPage - 1) * pageSize + 1;	// 1
				int endRow = startRow + pageSize - 1;				//10
				int startNum = totCnt - startRow + 1;				//38
				List<Board> replyList = bd.replyList(startRow, endRow,ref);
				int pageCnt = (int) Math.ceil((double) totCnt / pageSize);	//4 Page
				int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
				int endPage = startPage + blockSize - 1;
				if (endPage > pageCnt)
					endPage = pageCnt;
				
				request.setAttribute("totCnt", totCnt);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNum", startNum);
				request.setAttribute("replyList", replyList);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("pageCnt", pageCnt);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				
				request.setAttribute("bnum", bnum);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("board", board);
				
				System.out.println("bnum-->>"+bnum);
				System.out.println("ref-->>"+ref);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		return "content.jsp";
	}

}
