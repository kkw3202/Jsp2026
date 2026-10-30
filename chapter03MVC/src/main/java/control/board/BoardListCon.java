package control.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		// 페이징 처리
		// 변수
			// 전체 개시글 수
			int count = bdao.getAllCount(); 
			// 현재 페이지 넘버 (문자)
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) pageNum = "1";
			// 현재 페이지 넘버
			int currentPage = Integer.parseInt(pageNum);
			
			// 개시판에 글번호 만들기 용 변수 (맨 처음 개시글의 번호만 가져가서, jsp 에서 연산)
			int number = 0;
			
			// 한 화면에 띄울 개시글 수량
			int pageSize = 5;
			// 현재 페이지에 올라갈 첫 개시글 번호
			int startRow = (currentPage - 1) * pageSize;
			
			// 화면에 뿌릴 데이터 가져오기
			ArrayList<BoardDTO> blist = bdao.getAllboard(startRow, pageSize);
			
		// 연산
			// jsp 화면, 번호로 들어갈 number 값 연산
			// 단, 최신 글 순서대로 번호가 출력 => 최시 글 일 수록 글 번호가 커야함.
			// 현재 보고있는 페이지가 1번이라면 첫글 : 10, 막글 : 6
			number = count - startRow;
		
		// 실제 페이징을 처리해줄 계산 로직
			// 변수
				int pageCount = 0; // 전체 페이지 수를 담는 변수
				int pageBlock = 3; // 한 화면에 보일 페이지 번호의 수.
				int startPage = 1; // 현재 화면에 보이는 가장 첫번째 페이지 번호.
				int endPage = pageBlock; // 현재 화면에 보이는 가장 마지막 페이지 번호.
			
			// 연산
				// 게시글이 있다면
				if(count>0) {
					// startPage 구하기
					pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
					
					if(currentPage % pageBlock != 0) startPage = (currentPage / pageBlock) * pageBlock + 1;
					else startPage = ((currentPage / pageBlock)-1) * pageBlock + 1;
					// endPage 구하기
					// pageCount 가 endPage 작을 때 예외처리
					endPage = startPage + pageBlock -1;
					
					if(endPage > pageCount) endPage = pageCount;
						
				}

		// jsp로 넘기기
		request.setAttribute("blist", blist); // 게시글 데이터
		
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// HttpSession session = request.getSession(false);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=board/BoardList.jsp");
		rd.forward(request, response);
	}
}
