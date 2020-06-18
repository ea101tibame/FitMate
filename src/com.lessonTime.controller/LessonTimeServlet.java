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

		if ("get_Lesson_information".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String lessno = req.getParameter("lessno");
				String lessname = req.getParameter("lessname");
				Integer lesstimes = null;
				try {
					lesstimes = new Integer(req.getParameter("lesstimes"));
				} catch (NumberFormatException e) {
				}
				String lessend = req.getParameter("lessend");
				/*************************** 2.開始查詢資料 ****************************************/
				// 直接轉交前頁資訊
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("lessno", lessno);
				req.setAttribute("lessname", lessname);
				req.setAttribute("lesstimes", lesstimes);
				req.setAttribute("lessend", lessend);
				String url = "/front-end/lesson/addTime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 ************************************/

			} catch (Exception e) {
				throw new ServletException(e);
			}

		}

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
				System.out.println("lessno="+lessno);
				
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

				
				
				if (!errorMsgs.isEmpty()) {
					for (String str : errorMsgs) {
						System.out.println(str);
					}
					req.setAttribute("lessno", lessno);
					req.setAttribute("lessname", lessname);
					req.setAttribute("lesstimes", lesstimes);
					req.setAttribute("lessend", lessend);
					req.setAttribute("List<LessonTimeVO>", list); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/lesson/addTime.jsp");
					failureView.forward(req, res);
					return;
				}
			
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("lessno", lessno);
				System.out.println(lessno);
				req.setAttribute("lessname", lessname);
				System.out.println(lessname);
				req.setAttribute("lesstimes", lesstimes);
				System.out.println(lesstimes);
//				req.setAttribute("lessend", lessend);
//				System.out.println(lessend);
//				req.setAttribute("List<LessonTimeVO>", list);
				String url = "/front-end/lesson/showOneLessonTime.jsp";
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
