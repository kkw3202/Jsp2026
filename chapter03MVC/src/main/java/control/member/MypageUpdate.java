package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MypageUpdate.do")
public class MypageUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		String msg ="";
		
		
		String id = (String) session.getAttribute("id");
		// Mypage.jsp 의 hidden 에서 getparaMeter() 로 받아와도 됨!
		String id02 = request.getParameter("id");
		
		
		String dbPass = mdao.getPass(id);
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");
		
		
		if(!pass.equals(passchk)) {
			// 수정 하지않고 메시지 출력
			// Mypage.do 서블릿에 result=passfail 지정
			response.sendRedirect("Mypage.do?result=passfail");
			//msg = "비밀번호를 확인해주세요";
			
		}else {
			if(pass.trim().equals("") || pass.isEmpty()) pass = dbPass;
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			
			String hobbys[] = request.getParameterValues("hobby");
			String hobby = "";
			for(String a : hobbys) hobby += a + " ";
			
			String job = request.getParameter("job");
			String age = request.getParameter("age");
			String info = request.getParameter("info");
			
			mdto.setId(id);
			mdto.setPass(pass);
			mdto.setEmail(email);
			mdto.setTel(tel);
			mdto.setHobby(hobby);
			mdto.setJob(job);
			mdto.setAge(age);
			mdto.setInfo(info);
			
			int UpdateResult = mdao.setUpdateMember(mdto);
			
			if(UpdateResult > 0) {
				response.sendRedirect("Mypage.do?result=clear");
			}
			else {
				response.sendRedirect("Mypage.do?result=updatefail");
			}
		}
		
	}
	
}
