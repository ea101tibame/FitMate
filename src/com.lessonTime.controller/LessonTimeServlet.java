package com.lessonTime.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lesson.model.LessonService;
import com.lesson.model.LessonVO;
import com.lessonTime.model.LessonTimeService;
import com.lessonTime.model.LessonTimeVO;

@WebServlet("/LessonTimeServlet")
public class LessonTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LessonTimeServlet() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String[] ltime_date = req.getParameterValues("ltime_date");
				String[] ltime_ss = req.getParameterValues("ltime_ss");
				String lessno = req.getParameter("lessno");
				String lessname =req.getParameter("lessname");
				
				Integer lesstimes = null;
				try {
					lesstimes = new Integer(req.getParameter("lesstimes"));
				} catch (NumberFormatException e) {
				}
				String lessend = req.getParameter("lessend");
				
				LessonTimeVO lessonTimeVO = null;
				String date1=null;
				java.sql.Date dates = null;
				String ss1 =null;
				List<LessonTimeVO> list= new ArrayList<LessonTimeVO>();
				
				for (int i = 0; i < ltime_date.length; i++) {
					if("".equals(ltime_date[i])) {
						errorMsgs.add("第" +(i+1)+ "時間不可為空!");
					}
				}
				for (int i = 0; i < ltime_ss.length; i++) {
					if("".equals(ltime_ss[i])) {
						errorMsgs.add("第" +(i+1)+ "時段不可為空!");
					}
				}
				
				if(errorMsgs.isEmpty()) {
					for(int i =0;i<ltime_date.length;i++) {
						date1 = ltime_date[i];
						dates = java.sql.Date.valueOf(date1);
						ss1 = ltime_ss[i];
						lessonTimeVO = new LessonTimeVO();
						lessonTimeVO.setLtime_date(dates);
						lessonTimeVO.setLtime_ss(ss1);
						/*************************** 2.開始新增資料 ***************************************/
						LessonTimeService lessonTimeService = new LessonTimeService();
						lessonTimeService.addLessonTime(dates, ss1,lessno);
						
						//直接同時建DETAIL
						list.add(lessonTimeVO);
					}
				}

				LessonService lessonSvc = new LessonService();
				LessonVO lessonVO = lessonSvc.getOneByPK(lessno);
				
				if (!errorMsgs.isEmpty()) {
					for (String str : errorMsgs) {
						System.out.println(str);
					}

					req.setAttribute("lessno_seq", lessno);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/lesson/addTime.jsp");
					failureView.forward(req, res);
					return;
				}
			
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				String url = "/front-end/lesson/selectLesson.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/lesson/addTime.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
