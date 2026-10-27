package control.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 데이터베이스에 연결하여 연결하여 전체회원의 모든 정보를 리턴
		// 회원 여러명의 자료를 화면에 출력하기 위해 DB에서 select 로 꺼내온다. => 자료가 몇 개 나올지 확실하지않음 => ArrayList에 담아야 함.
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> allMember = mdao.getAllMember(); 
		
		request.setAttribute("allMember", allMember);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MemberList.jsp");
		rd.forward(request, response);
	}

}
