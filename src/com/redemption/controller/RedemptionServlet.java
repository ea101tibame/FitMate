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
		
		//新增點數兌換申請(預設狀態=未處理)
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String coano = req.getParameter("coano");
				Integer redprice = null ;
				try {
					redprice = new Integer(req.getParameter("redprice").trim());
				} catch (NumberFormatException e) {
					redprice = 0 ;
				}
				
				RedemptionVO redVO = new RedemptionVO();
				redVO.setCoano(coano);
				redVO.setRedprice(redprice);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("redVO", redVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/redemption/addOneRedemption.jsp");
					failureView.forward(req, res);
					return;
				}
				
				RedemptionService redSvc = new RedemptionService();
				redVO = redSvc.addRed(coano, redprice);
				
				req.setAttribute("redVO", redVO);
				String url = "/front-end/redemption/showAllRedemption.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/redemption/insertRedemption.jsp");
				failView.forward(req, res);
			}
		}
		
		//更改兌換狀態(ajax預定)
		if("change".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			try {
				String redno = req.getParameter("redno");
				RedemptionService redSvc = new RedemptionService();
				redSvc.alterRed(redno);
				req.setAttribute("redno", redno);
					
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/deposit/deposit_index.jsp");
				failView.forward(req, res);
				}
		}
		
		//跳轉兌換頁面
		if("goInsert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			HttpSession session = req.getSession();
			
			try{
				String coano = req.getParameter("coano");
				req.setAttribute("coano", coano);
				
				String url = "/front-end/redemption/addOneRedemption.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/redemption/redemption_index.jsp");
				failView.forward(req, res);
			}
		}
					
	}

}
