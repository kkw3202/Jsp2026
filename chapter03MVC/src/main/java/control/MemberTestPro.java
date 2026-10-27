package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberTestDTO;


@WebServlet("/Mproc.do") // form 의 action 부분을 매핑. 슬래시(절대주소) 반드시 필요
public class MemberTestPro extends HttpServlet {
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩 까먹지 않기
		
		// MemberTestDTO 가져오기
		// MemberTestDTO 의 용도 : MemberTest.jps에서 입력한 input의 name 속성을 담아둠
		// MemberTestDTO 가져오기 : 클래스이므로, 인스턴스해서 사용
		
		memberTestDTO mtdto = new memberTestDTO();
		mtdto.setId(request.getParameter("id"));
		mtdto.setPass(request.getParameter("pass"));
		mtdto.setEmail(request.getParameter("email"));
		mtdto.setTel(request.getParameter("tel"));
		mtdto.setAddress(request.getParameter("address"));
		
		// request.setAttribute() 로 mtdto 를 한번에 담아서 View 로 넘긴다.
		request.setAttribute("mt", mtdto); // "mt" 라는 이름으로 mtdto 를 담아둠. 화면에 그릴때 mt를 표현식에 담아서 출력
		
		// MemberTestView 페이지로 내보내기
		RequestDispatcher rd = request.getRequestDispatcher("MemberTestView.jsp");
		// 리퀘스트디스패쳐 객체    = 리퀘스트.갯리퀘스트리스패쳐("보낼 파일명")
		rd.forward(request, response);
	}

}
