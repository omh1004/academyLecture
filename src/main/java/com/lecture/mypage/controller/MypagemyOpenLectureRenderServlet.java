package com.lecture.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lecture.mypage.model.dto.OpenLecture;
import com.lecture.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MypagemyOpenLectureRenderServlet
 */
@WebServlet("/mypage/myopenRenderSchedule.do")
public class MypagemyOpenLectureRenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagemyOpenLectureRenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		response.setContentType("application/json;charset=UTF-8");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        

        Map<String, List<HashMap<String, String>>> scheduleMap = new HashMap<>();
        
        if(month.length()==1) {
        	month= "0"+month;
        }
        
        Map<String,String> daily = new HashMap<>();
        daily.put("year", year);
        daily.put("month", month);
        
        scheduleMap = new MyPageService().selectMyopenLectureByCalender(daily);
        
        System.out.println("scheduleMap:::"+scheduleMap);
        
        
        try (PrintWriter out = response.getWriter()) {
            Gson gson = new Gson();
            out.print(gson.toJson(scheduleMap));
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
