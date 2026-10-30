package control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardInfoControl.do")
public class BoardInfoControl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardDTO bdto = new BoardDTO(); 
		BoardDAO bdao = new BoardDAO(); 
		int num = Integer.parseInt(request.getParameter("num"));
		
		bdao.readcountUper(num);

		bdto = bdao.getBoardInfo(num);
		
		request.setAttribute("bdto", bdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=/board/BoardInfo.jsp");
		rd.forward(request, response);
	}
}
