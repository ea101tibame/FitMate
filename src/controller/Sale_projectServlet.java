package com.sale_project.controller;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.product_order.model.Product_orderService;
import com.product_order.model.Product_orderVO;
import com.sale_list.model.Sale_listVO;
import com.sale_project.model.Sale_projectService;
import com.sale_project.model.Sale_projectVO;


public class Sale_projectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Sale_projectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("action=" + action);
		System.out.println("11111111111111111111111111111111111111111111111111111111");
	
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/****************************** 1.接收請求參數 *****************************/
				String sapro_no = new String(req.getParameter("sapro_no"));
				System.out.println("getOne_For_Update的促銷編號為" + sapro_no);
				/****************************** 2.開始查詢資料 ****************************/
				Sale_projectService saproSvc = new Sale_projectService();
				Sale_projectVO sale_projectVO = saproSvc.getOneSp(sapro_no);
				/********************** 3.查詢完成,準備轉交(Send the Success view) ********/
				req.setAttribute("sale_projectVO", sale_projectVO);
				String url = "/back-end/product/update_sale_project_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/product/sale_projectManage.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				
				//促銷開始日期
				java.sql.Date sapro_start = null;
				try {
					sapro_start = java.sql.Date.valueOf(req.getParameter("sapro_start").trim());
					System.out.println(sapro_start);
				} catch (IllegalArgumentException e) {
					sapro_start=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				//促銷結束日期
				java.sql.Date sapro_end = null;
				try {
					sapro_end = java.sql.Date.valueOf(req.getParameter("sapro_end").trim());
					System.out.println(sapro_end);
				} catch (IllegalArgumentException e) {
					sapro_start=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String prodno =req.getParameter("prodno");
				System.out.println(prodno);
				if(prodno==null||prodno.trim().length()==0) {
					errorMsgs.add("商品編號不得為空");
				}
				
				Integer sapro_price=null;
				try {
					sapro_price = new Integer(req.getParameter("sapro_price").trim());
					System.out.println(sapro_price);
					if(sapro_price<0) {
						errorMsgs.add("商品價格不得小於零");
					}
				}catch(NumberFormatException e) {
					sapro_price=0;
					errorMsgs.add("商品價格不得為零");
				}
				

				Sale_projectVO sale_projectVO = new Sale_projectVO();
				
				sale_projectVO.setSapro_start(sapro_start);
				sale_projectVO.setSapro_end(sapro_end);

				List<Sale_listVO> list = new ArrayList<Sale_listVO>();
				Sale_listVO sale_listVO = new Sale_listVO();
				sale_listVO.setProdno("prodno");
				sale_listVO.setSapro_price(sapro_price);
				list.add(sale_listVO);
				

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("sale_projectVO", sale_projectVO);
					req.setAttribute("sale_listVO", sale_listVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/product/addSale_project.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				Sale_projectService saproSvc = new Sale_projectService();
				saproSvc.insertWithSaleList(sale_projectVO,list);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("sale_projectVO", sale_projectVO);
				String url = "/back-end/product/sale_projectManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/product/addSale_project.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}