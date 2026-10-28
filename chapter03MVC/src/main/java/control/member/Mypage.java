package control.member;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {

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
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			String id = (String) session.getAttribute("id");
			
			mdto = mdao.getMemberDetail(id);
			
			request.setAttribute("id", mdto.getId());
			request.setAttribute("email", mdto.getEmail());
			request.setAttribute("tel", mdto.getTel());
			
			
			String hobby = mdto.getHobby();
			StringTokenizer st = new StringTokenizer(hobby, " ");
			int[] hobbys = {0,0,0,0};
			
			
			while(st.hasMoreTokens()) {
				String tokenChk = st.nextToken();
				if(tokenChk.equals("캠핑")) hobbys[0]=1;
				else if(tokenChk.equals("등산")) hobbys[1]=1;
				else if(tokenChk.equals("영화")) hobbys[2]=1;
				else if(tokenChk.equals("독서")) hobbys[3]=1;
			}
			
			
			
			request.setAttribute("hobby", hobbys);
			request.setAttribute("job", mdto.getJob());
			request.setAttribute("age", mdto.getAge());
			request.setAttribute("info", mdto.getInfo());
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=member/Mypage.jsp");
			rd.forward(request, response);
		}else {
			String msg = "로그인 후 이용해주세요";
			
		}
		
		
		
		
	}

}
