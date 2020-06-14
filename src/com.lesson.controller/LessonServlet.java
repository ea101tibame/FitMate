package com.lesson.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import test.expertise.model.ExpertiseVO;


@WebServlet("/LessonVO")
@MultipartConfig
public class LessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LessonServlet() {
        super();
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String ename = req.getParameter("lessname");
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("課堂名稱: 請勿空白");
				} 
				String expno = new String(req.getParameter("expno").trim());
				
				Integer lessmax =null;
				try{
					lessmax= new Integer(req.getParameter("lessmax").trim());

				}catch (NumberFormatException e) {
					lessmax = 0;
						errorMsgs.add("上限人數請填數字");
				}
				Integer lessmin =null;
				try{
					lessmax= new Integer(req.getParameter("lessmin").trim());

				}catch (NumberFormatException e) {
					lessmin = 0;
						errorMsgs.add("下限人數請填數字");
				}
				
				Integer lessprice =null;
				try{
					lessprice= new Integer(req.getParameter("lessprice").trim());

				}catch (NumberFormatException e) {
					lessprice = 0;
						errorMsgs.add("課程欲售點數請填數字");
				}
				
				
		}catch(Exception e){
			}
		}
		doGet(req, res);
	}

}
