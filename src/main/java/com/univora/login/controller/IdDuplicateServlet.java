package com.univora.login.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.univora.login.model.dto.Member;
import com.univora.login.model.service.MemberService;
/**
 * Servlet implementation class IdDuplicateServlet
 */
@WebServlet("/login/idduplicate.do")
public class IdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("id");
		System.out.println(memberId);
		
		Member m = new MemberService().selectMemberById(memberId);
		
		boolean isDuplicate = (m != null);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write("{\"isDuplicate\": " + isDuplicate + "}");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}