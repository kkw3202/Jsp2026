package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;
import java.util.Date;

/**
 * Servlet implementation class BoardWriteProcCon
 */
@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {

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
		
		HttpSession session = request.getSession(false);
		
		String loginId = (String)session.getAttribute("id");
		
		if(loginId == null) {
			
		}else {
		
			String writer = request.getParameter("writer");
			String subject =request.getParameter("subject");
			String email =request.getParameter("email");
			String password =request.getParameter("password");
			String content =request.getParameter("content");
			String id = loginId;
			
			bdto.setWriter(writer);
			bdto.setSubject(subject);
			bdto.setEmail(email);
			bdto.setPassword(password);
			bdto.setContent(content);
			bdto.setId(id);
			
			bdao.insertBoard(bdto);
			
			response.sendRedirect("BoardListCon.do");
			
		}
	}
}
