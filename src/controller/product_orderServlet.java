package com.product_order.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product_order.model.*;

public class product_orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/****************************** 1.接收請求參數 *****************************/
				String pordno = new String(req.getParameter("pordno"));
				System.out.println("getOne_For_Update的訂單編號為"+pordno);
				/****************************** 2.開始查詢資料 ****************************/
				Product_orderService prod_ordSvc = new Product_orderService();
				Product_orderVO product_orderVO = prod_ordSvc.getOnePo(pordno);
				/********************** 3.查詢完成,準備轉交(Send the Success view) ********/
				req.setAttribute("product_orderVO", product_orderVO);
				String url = "/back-end/product/update_product_order_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/product/product_orderManage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String pordadd = req.getParameter("pordadd");
				System.out.println("訂單地址為"+pordadd);
				String pordno = req.getParameter("pordno");
System.out.println("訂單編號為:"+pordno);
				Integer pordtotal=null;
				pordtotal = new Integer(req.getParameter("pordtotal"));
System.out.println("訂單總金額為"+pordtotal);
String stuno = req.getParameter("stuno");
System.out.println("學員編號為"+stuno);
				
				String pordsta = req.getParameter("pordsta");
System.out.println("訂單狀態為"+pordsta);
				Integer fare=null;
				fare = new Integer(req.getParameter("fare"));
System.out.println("運費為"+fare);

				Product_orderVO product_orderVO = new Product_orderVO();
				product_orderVO.setPordno(pordno);
				product_orderVO.setStuno(stuno);
				product_orderVO.setPordtotal(pordtotal);
				product_orderVO.setPordadd(pordadd);
				product_orderVO.setPordsta(pordsta);
				product_orderVO.setFare(fare);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("product_orderVO", product_orderVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/update_product_order_input.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/************* 2.開始修改資料 **************************/
				Product_orderService prod_ordSvc = new Product_orderService();
				product_orderVO = prod_ordSvc.updatePo(pordno, stuno, pordtotal, pordadd, pordsta, fare);
				/************* 3.修改完成，準備轉交 **************************/
				req.setAttribute("product_orderVO", product_orderVO);
				String url = "/back-end/product/product_orderManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/product/update_product_order_input.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
