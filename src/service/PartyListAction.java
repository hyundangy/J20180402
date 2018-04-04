package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Party;
import dao.PartyDAO;
import dao.PartyMem;
public class PartyListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		PartyDAO pd = PartyDAO.getInstance();
		try { int totCnt  = pd.getTotalCnt();			
				String pageNum = request.getParameter("pageNum");	
				if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
				int currentPage = Integer.parseInt(pageNum);	
				int pageSize  = 10, blockSize = 10;
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow   = startRow + pageSize - 1;
				int startNum = totCnt - startRow + 1;
				List<Party> list = pd.list(startRow, endRow);	
				List<PartyMem>memList = pd.memList();
				int count = pd.getTotalCnt();
				int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
				int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
				int endPage = startPage + blockSize -1;	
				if (endPage > pageCnt) endPage = pageCnt;	
				request.setAttribute("totCnt", totCnt);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNum", startNum);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("pageCnt", pageCnt);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("count", count);
				request.setAttribute("memList", memList);
		
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "partyBoard.jsp";
	}
}