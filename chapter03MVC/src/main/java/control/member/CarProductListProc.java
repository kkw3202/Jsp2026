package control.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.CarDTO;
import model.member.MemberDAO;

@WebServlet("/CarProductListProc.do")
public class CarProductListProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		CarDTO cdto = new CarDTO();
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<CarDTO> carAll = mdao.getAllCarProduct();
		
		request.setAttribute("carAll", carAll);
		
		System.out.println(carAll.get(0).getCarName());
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=section.jsp");
		rd.forward(request, response);
		
		
	}
}
