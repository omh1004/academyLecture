package com.univora.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.PurchaseHistory;
import com.univora.mypage.model.service.MyPageService;

/**
 * Servlet implementation class PurchaseHistoryServlet
 */
@WebServlet("/mypage/purchaseHistory.do")
public class PurchaseHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        //System.out.println("구매내역 : " + loginMember);
		
        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
		
        String studentId = loginMember.getMemberNo();
        //System.out.println(studentId);
        MyPageService service = new MyPageService();
        List<PurchaseHistory> purchaseHistory = service.getPurchaseHistory(studentId);

        request.setAttribute("purchaseHistory", purchaseHistory);
        request.getRequestDispatcher("/WEB-INF/views/mypage/mypagePurchaseHistory.jsp").forward(request, response);
    }
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
