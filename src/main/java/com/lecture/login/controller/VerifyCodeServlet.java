package com.lecture.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerifyCodeServlet
 */
@WebServlet("/login/verifycode.do")
public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String inputCode = request.getParameter("checkNum");

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (email == null || email.isEmpty() || inputCode == null || inputCode.isEmpty()) {
            out.write("{\"success\": false, \"message\": \"이메일과 인증번호를 모두 입력해주세요.\"}");
            return;
        }

        boolean isCodeValid = SendCodeByEmailServlet.verifyCode(email, inputCode);

        if (isCodeValid) {
            out.write("{\"success\": true, \"message\": \"인증번호가 확인되었습니다.\"}");
        } else {
            out.write("{\"success\": false, \"message\": \"인증번호가 일치하지 않습니다.\"}");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
