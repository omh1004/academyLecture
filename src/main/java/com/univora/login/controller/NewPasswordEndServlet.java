package com.univora.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.common.PasswordEncoding;
import com.univora.login.model.service.MemberService;

/**
 * Servlet implementation class NewPasswordEndServlet
 */
@WebServlet("/login/newpasswordend.do")
public class NewPasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		PasswordEncoding pe = new PasswordEncoding(request);
		
		String password = pe.getParameter("password");
		
		HttpSession session = request.getSession();
		String memberNo = (String) session.getAttribute("findPwdMemberNo");
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("memberNo", memberNo);
		param.put("memberPwd", password);
		
		int result = new MemberService().updateMemberInfo(param);
		
		String msg, loc = "/login/findpasswordend.do";
		
		if(result > 0) {
			msg = "새로운 비밀번호로 설정 되었습니다. 로그인 페이지로 이동합니다.";
			loc = "/main/index.do";
		}else {
			msg = "새로운 비밀번호 설정이 실패되었습니다. 다시 시도해주세요.";
			loc= "/login/findpassword.do";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		response.setContentType("text/html;charset=utf-8");
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
