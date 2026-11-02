package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;

@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO bdao = new BoardDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String userPw = request.getParameter("userPw");
		String dbPw = request.getParameter("dbPw");
		
		
		
		
		
		if(dbPw.equals(userPw) && userPw != null) {
			bdao.boardDelete(num);
			
			response.sendRedirect("BoardListCon.do");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.');");
			out.print("history.go(-1);");
			out.println("</script>");
			out.flush();
		}
	}
}
