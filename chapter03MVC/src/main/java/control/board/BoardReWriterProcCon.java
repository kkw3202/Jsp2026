package control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardReWriterProcCon.do")
public class BoardReWriterProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		BoardDTO bdto = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
		
		String writer = request.getParameter("writer");
		String subject =request.getParameter("subject");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		String content =request.getParameter("content");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		
		
		
		bdto.setWriter(writer);
		bdto.setSubject(subject);
		bdto.setEmail(email);
		bdto.setPassword(password);
		bdto.setContent(content);
		bdto.setRef(ref);
		bdto.setRe_step(re_step);
		bdto.setId(id);
		
		bdao.reinsertBoard(bdto);
		
		response.sendRedirect("BoardListCon.do");
		
		// RequestDispatcher rd = request.getRequestDispatcher("BoardListCon.do");
		// rd.forward(request, response);
		
	}
}
