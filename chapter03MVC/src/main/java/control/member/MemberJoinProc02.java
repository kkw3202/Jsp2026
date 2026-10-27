package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;

/**
 * Servlet implementation class MemberJoinProc
 */
@WebServlet("/MProc02.do")
public class MemberJoinProc02 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.인코딩 
		// 2.input 에서 받은 값 request로 가져오기
		// 3.DTO, DAO 인스턴스	및 set()
		// 4.예외처리(중복 데이터, 비번=비번확인 등..) 하기
		// 5.requset.setAttribute()에 담기
		// 6.RequsetDispatcher 객체로 .forword()해서 .jsp 파일로 페이지 넘기기
		
		request.setCharacterEncoding("utf-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		mdto.setId(request.getParameter("id"));
		mdto.setPass(request.getParameter("pass"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		// hobby는 배열!
		String[] hobbyArr=request.getParameterValues("hobby");
		String hobbyPrt = "";
		for(String a : hobbyArr) hobbyPrt += a+" ";
		
		mdto.setHobby(hobbyPrt);
		
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		
		String msg = "";
		
		boolean isSameId = true;
		boolean isSamePass = true;

		String id = request.getParameter("id");
		String idChk = mdao.getId(id);
		String pass = request.getParameter("pass");
		String passChk = request.getParameter("passchk");
		
		// 예외처리 중복 아이디 체크 => 현재 DB연결이 없어서 체크 불가능
		if(id.equals(idChk)) {
			isSameId = false;
			msg = "중복된 아이디가 존재합니다";
		}
		// 예외처리 pass != passChk => 비밀번호를 확인하세요
		else if(!pass.equals(passChk)) {
			isSamePass = false;
			msg = "비밀번호를 확인하세요" + pass + passChk;
		}
		
		
		// pass = passChk => insert
		if(!isSameId || !isSamePass) {
			System.out.println(msg);
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("member/MemberView.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("mt", mdto);
			RequestDispatcher rd = request.getRequestDispatcher("member/MemberView.jsp");
			rd.forward(request, response);
		}
	}
}
