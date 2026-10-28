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

@WebServlet("/MProc.do")
public class MemberJoinProc extends HttpServlet {

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
		
		String id = request.getParameter("id");
		String idChk = mdao.getId(id);
		String pass = request.getParameter("pass");
		String passChk = request.getParameter("passchk");
		
		mdto.setId(id);
		mdto.setPass(pass);
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

		
		
		String link ="";
		
		// 예외처리 중복 아이디 체크 => 현재 DB연결이 없어서 체크 불가능
		if(id.equals(idChk)) {
			request.setAttribute("msgid", "이미 존재하는 아이디 입니다");
			link = "/member/joinIderr.jsp";
		}
		
		// pass = passChk => insert
		else if(pass.equals(passChk)) {
			// mdao 의 쿼리 메소드와 연결
			mdao.insertMember(mdto);
			
			// 회원 전체 목록 리스트로 이동 (MemberList)
			// MemberJoinProc 컨트롤러 => MemberListCon.do 컨트롤러로 이동
			// jsp에서 DB가 수정되는 쿼리는 forward가 아닌, sendRedirect 로 내보내야함.
				// forward는 select처럼 단순히 긁어오는 내용을 출력 할 때만 사용. 
					// forward가 새로고침 시 원래 요청을 재전송 하기 때문
					// sendRedirect는 이동한 "주소만" 재요청. && response의 매소드! && / 없이 매핑!
			link = "index.jsp";
		}
		// 예외처리 pass != passChk => 비밀번호를 확인하세요
		else {
			request.setAttribute("msgpass", "비밀번호를 확인하세요");
			link = "/member/joinerr.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(link);
		
		
		if(!link.equals("index.jsp")) rd.forward(request, response); // 새로고침하면 다시 실행됨.
		else {
			response.sendRedirect(link);
			
		}
	}
}
