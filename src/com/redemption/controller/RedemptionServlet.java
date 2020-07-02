package com.redemption.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coach.model.*;
import com.employee.model.MailService;
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
			HttpSession session = req.getSession();
			
			try {
				CoaVO coaVO = (CoaVO) session.getAttribute("coaVO");
				String coano = coaVO.getCoano();
				
				req.setAttribute("coano", coano);	//轉交coano到view層jsp,在view層new一個Service呼叫all給coano做查詢				
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
					errorMsgs.add("兌換點數不可為0,請重新確認");
				}
				RedemptionVO redVO = new RedemptionVO();
				redVO.setCoano(coano);
				redVO.setRedprice(redprice);								
				//抓教練現有點數
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getOneCoa(coano);
				Integer coapoint = coaVO.getCoapoint();
				//點數兌換判斷
				if(redprice > coapoint) {
					errorMsgs.add("申請點數超過您目前持有點數,請重新確認");
				} else {
					//新增記錄到後台表格
					RedemptionService redSvc = new RedemptionService();
					redVO = redSvc.addRed(coano, redprice);
					//點數相減後更新到教練表格
					Integer newpoint = coapoint - redprice ;
					redSvc.alterCoaPoint(coano, newpoint);
				}

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("redVO", redVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/redemption/addOneRedemption.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("redVO", redVO);
				String url = "/front-end/redemption/redemption_index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/redemption/redemption_index.jsp");
				failView.forward(req, res);
			}
		}
		
		//更改兌換狀態(ajax預定)(目前form版)
		if("change".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			try {
				String redno = req.getParameter("redno").trim();
				System.out.println("redno="+redno);
				RedemptionService redSvc = new RedemptionService();
				redSvc.alterRed(redno);
				
				//取得redemption的教練編號&申請日期
				RedemptionVO redVO = redSvc.getCoaByRed(redno);
				String coano = redVO.getCoano();
				
				String reddate = new SimpleDateFormat("yyyy-MM-dd").format(redVO.getReddate());
				System.out.println("reddate="+reddate);
				//取得教練VO抓name跟mail
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getOneCoa(coano);
				String email = coaVO.getCoamail();
				String coaname = coaVO.getCoaname();
				//準備信件內容
				String subject = "點數兌換審核通知";
				String messageText = "FitMate合作教練"+coaname+"您好,您在"+reddate+"申請的點數兌換已通過審核,金額將在數個工作日後透過您的帳戶入款,工作日將依銀行而有所不同,敬請耐心等待"
						+ "\t"+"FitMate工作團隊 敬上";
				//送信
				MailService mSvc = new MailService();
				mSvc.sendMail(email, subject, messageText);
				
				req.setAttribute("redno", redno);
				String url = "/back-end/redemption/showAllRedemptionBack.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("系統提示:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/deposit/deposit_index.jsp");
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