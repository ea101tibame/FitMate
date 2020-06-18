package com.coach.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class CreateCoaServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		System.out.println("action: " + action);

//      		
//      		
//      	else if ("update".equals(action)) { // 來自update_coach_input.jsp的請求
//      			
//      			List<String> errorMsgs = new LinkedList<String>();
//      			// Store this set in the request scope, in case we need to
//      			// send the ErrorPage view.
//      			req.setAttribute("errorMsgs", errorMsgs);
//      		
//      			try {
//      				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//      				
//      				Integer coano = new Integer(req.getParameter("coano").trim());
//      				
//      				String coaname = req.getParameter("coaname");
//    				String coanameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//    				if (coaname == null || coaname.trim().length() == 0) {
//    					errorMsgs.add("教練姓名: 請勿空白");
//    				} else if(!coaname.trim().matches(coanameReg)) { //以下練習正則(規)表示式(regular-expression)
//    					errorMsgs.add("教練姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//    	            }
//    				
//    				String coapsw = req.getParameter("coapsw").trim();
//    				String coapswRege = "^[A-Za-z0-9]{6,10}$";
//    				if (coapsw == null || coapsw.trim().length() == 0){
//    					errorMsgs.add("密碼: 只能是大寫或小寫英文字母和數字 , 且長度必需在6到10之間");
//    				}
//    				
//    				String coamail = req.getParameter("coamail").trim();
//    				String coamailRege = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
//    				if (coamail == null || coamail.trim().length() == 0){
//    					errorMsgs.add("信箱:必需包含@，且@前必需含字母(2~15個)，@後可以是字母或(和)數字(至少3個)，.後至少兩個小寫字母");
//    				}
//    				
//    				String coatel = req.getParameter("coatel").trim();
//    				String coatelRege = "/^09[0-9]{8}$/";
//    				if (coatel == null || coatel.trim().length() == 0){
//    					errorMsgs.add("電話:必需是09開頭且後方接著0-9，共八個數字");
//    				}
//    				
//    				String coaacc = req.getParameter("coaacc").trim();
//    				String coaaccRege = "/^[0-9]{12,14}$/";
//    				if (coatel == null || coatel.trim().length() == 0){
//    					errorMsgs.add("帳戶:0-9的數字，12~14個數字");
//    				}
//    				
//    				Part pic = req.getPart("coapic");
//    				InputStream in = pic.getInputStream();
//    				byte[] coapic= new byte[in.available()];
//    				in.read(coapic);
//    				
//    				String coasex= req.getParameter("coasex").trim();
//    				
//    				CoaVO coaVO = new CoaVO();
//    				coaVO.setCoaname(coaname);
//    				coaVO.setCoapsw(coapsw);
//    				coaVO.setCoamail(coamail);
//    				coaVO.setCoatel(coatel);
//    				coaVO.setCoaacc(coaacc);
//    				coaVO.setCoapic(coapic);
//    				coaVO.setCoasex(coasex);
//
//    				
//      				// Send the use back to the form, if there were errors
//      				if (!errorMsgs.isEmpty()) {
//      					req.setAttribute("coaVO", coaVO); // 含有輸入格式錯誤的coaVO物件,也存入req
//      					RequestDispatcher failureView = req
//      							.getRequestDispatcher("/coach/update_coach_input.jsp");
//      					failureView.forward(req, res);
//      					return; //程式中斷
//      				}
//      				
//      				/***************************2.開始修改資料*****************************************/
//      				CoaService coaSvc = new CoaService();
//      				coaVO = coaSvc.updateCoach (coano, coaname, coapsw, coamail, coatel,coaacc,coapic,coasex);
//      								
//      				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//      				req.setAttribute("coaVO", coaVO); // 資料庫update成功後,正確的的coaVO物件,存入req
//      				String url = "/coach/listOneCoach.jsp";
//      				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneCoach.jsp
//      				successView.forward(req, res);
//
//      				/***************************其他可能的錯誤處理*************************************/
//      			} catch (Exception e) {
//      				errorMsgs.add("修改資料失敗:"+e.getMessage());
//      				RequestDispatcher failureView = req
//      						.getRequestDispatcher("/coach/update_coach_input.jsp");
//      				failureView.forward(req, res);
//      			}
//      		}
//顯示單筆資料

//		else if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String str = req.getParameter("coano");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入教練編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/coach/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				String coano = null;
//				try {
//					coano = new String(str);
//				} catch (Exception e) {
//					errorMsgs.add("教練編號格式不正確");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/coach/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				/*************************** 2.開始查詢資料 *****************************************/
//				CoaService coaSvc = new CoaService();
//				CoaVO coaVO = coaSvc.getOneCoa(coano);
//				if (coaVO == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/coach/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("coaVO", coaVO); // 資料庫取出的coaVO物件,存入req
//				String url = "/coach/listOneCoach.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneCoa.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/coach/select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}

		// 顯示全部教練資料
		try {
			/*************************** 1.接收請求參數 ***************************************/

			/*************************** 2.開始刪除資料 ***************************************/

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/front-end/coach/addCoach.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {
			RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coach/addCoach.jsp");
			failureView.forward(req, res);
		}
	}
}
