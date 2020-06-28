package com.redemption.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redemption.model.*;

public class RedemptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		
		//查詢個人點數兌換紀錄
		if("showAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String coano = req.getParameter("coano");
				RedemptionService redSvc = new RedemptionService();
				List<RedemptionVO>redlist = redSvc.showAllRed(coano);
				
				req.setAttribute("redlist", redlist);
				String url = "/front-end/redemption/showAllRedemption.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/redemption/redemption_index.jsp");
				failView.forward(req, res);
			}
		}
		
		//新增點數兌換申請
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/redemption/insertRedemption.jsp");
				failView.forward(req, res);
			}
		}
	}

}
