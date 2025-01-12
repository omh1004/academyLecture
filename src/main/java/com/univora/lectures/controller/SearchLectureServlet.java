package com.univora.lectures.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.lectures.model.dto.Lectures;
import com.univora.lectures.model.service.LectureService;

/**
 * Servlet implementation class SearchLectureServlet
 */
@WebServlet("/lecture/search.do")
public class SearchLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String query = request.getParameter("query");

	    if (query == null || query.trim().isEmpty()) {
	        query = ""; // 검색어가 없으면 빈 문자열로 초기화
	    }

	    LectureService lectureService = new LectureService();
	    List<Lectures> searchResults = null;

	    
	    System.out.println("query::: "+ query);
	    
	    try {
	        searchResults = lectureService.searchLectures(query.trim());
	    } catch (RuntimeException e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "검색 중 문제가 발생했습니다. 다시 시도해주세요.");
	    }

	    request.setAttribute("searchResults", searchResults);
	    request.setAttribute("query", query);

	    request.getRequestDispatcher("/WEB-INF/views/lecture/searchResults.jsp").forward(request, response);
	    
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
