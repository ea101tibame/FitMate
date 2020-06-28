package com.student.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.student.model.StuService;
import com.student.model.StuVO;
import com.utils.MailUtil;
import com.utils.StringUtil;

@MultipartConfig
public class StuServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// 新增一筆學員資料
		if ("insert".equals(action)) { // 來自addStudent.jsp的請求
			Map<String, String> errorMsgs = new HashMap<String, String>();
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String stuname = req.getParameter("stuname").trim();
				System.out.println("stuname: " + stuname);
				String stunameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (stuname == null || stuname.trim().length() == 0) {
					errorMsgs.put("stuname", "學員姓名: 請勿空白");
				} else if (!stuname.trim().matches(stunameReg)) {
					errorMsgs.put("stuname", "學員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String stupsw = StringUtil.genRamdomStr(6);
				System.out.println("stupsw: " + stupsw);
//				String stupswRege = "^[A-Za-z0-9]{6,10}$";
//				if (stupsw == null || stupsw.trim().length() == 0) {
//					errorMsgs.put("stupsw", "密碼: 只能是大寫或小寫英文字母和數字 , 且長度必需在6到10之間");
//				}

				String stumail = req.getParameter("stumail").trim();
				System.out.println("stumail: " + stumail);
				String stumailReg = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (stumail == null || stumail.trim().length() == 0 || !Pattern.matches(stumailReg, stumail)) {
					errorMsgs.put("stumail", "信箱:必需包含@，且@前必需含字母(2~15個)，@後可以是字母或(和)數字(至少3個)，.後至少兩個小寫字母");
				}

				String stutel = req.getParameter("stutel").trim();
				System.out.println("stutel: " + stutel);
				String stutelRege = "/^09[0-9]{8}$/";
				if (stutel == null || stutel.trim().length() == 0) {
					errorMsgs.put("stutel", "電話:必需是09開頭且後方接著0-9，共八個數字");
				}

				Part picPart = req.getPart("stupic");
				InputStream picIn = picPart.getInputStream();
				byte[] stupic = new byte[picIn.available()];
				picIn.read(stupic);
				picIn.close();

				String stusex = req.getParameter("stusex");
				System.out.println("stusex: " + stusex);

				String zipcode = req.getParameter("zipcode").trim();
				String city = req.getParameter("city").trim();
				String town = req.getParameter("town").trim();
				String stuadd = req.getParameter("stuadd").trim();
				stuadd = zipcode + city + town + stuadd;
				System.out.println("stuadd: " + stuadd);
				if (stuadd == null || stuadd.trim().length() == 0) {
					errorMsgs.put("stuadd", "請輸入詳細地址");
				}

				java.sql.Date stubir = null;
				try {
					stubir = java.sql.Date.valueOf(req.getParameter("stubir").trim());
				} catch (IllegalArgumentException e) {
					stubir = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("stubir", "請輸入日期!");
				}

				// TODO Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {// 如果有任何錯誤訊息
					StuVO stuVO = new StuVO();

					stuVO.setStuname(stuname);
					stuVO.setStupsw(stupsw);
					stuVO.setStumail(stumail);
					stuVO.setStutel(stutel);
					stuVO.setStupic(stupic);
					stuVO.setStusex(stusex);
					stuVO.setStuadd(stuadd);
					stuVO.setStubir(stubir);

					req.setAttribute("stuVO", stuVO);
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/student/addStudent.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				StuService stuSvc = new StuService();
				StuVO stuno = stuSvc.addStu(stuname, stupsw, stumail, stutel, stupic, stusex, stuadd, stubir);

				MailUtil mailUtil = new MailUtil();
				mailUtil.sendMail(stumail, "Sign Up success!", "your password is " + stupsw);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("other errors", e.getMessage());
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/student/addStudent.jsp");
				failureView.forward(req, res);
			}
		}

		// for ajax
//		else if ("BackendUpdate".equals(action)) {
//			res.setContentType("application/json");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			String stuno = (String) req.getParameter("stuno");
//			String stusta = (String) req.getParameter("stusta");
//			try {
//				StuService stuSvc = new StuService();
//				StuVO StuVo = stuSvc.getOneStu(stuno);
//				stuSvc.updateStu(stuno, stuname, stuVO.getStupsw(), stuadd, stubir, stumail, stutel,
//						stuVO.getStupoint(), stuVO.getStusta(), stupic, stusex);
//				JSONObject jsonObject = new JSONObject();
//				jsonObject.put("error_code", "0");
//				out.print(jsonObject.toString());
//				out.flush();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				out.close();
//			}
//		}

		// for submit form
//		else if ("update".equals(action)) {
//			Map<String, String> errorMsgs = new HashMap<String, String>();
//			try {
//				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				String stuname = req.getParameter("stuname").trim();
//				System.out.println("stuname: " + stuname);
//				String stunameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (stuname == null || stuname.trim().length() == 0) {
//					errorMsgs.put("stuname", "學員姓名: 請勿空白");
//				} else if (!stuname.trim().matches(stunameReg)) {
//					errorMsgs.put("stuname", "學員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}
//
//				String stupsw = StringUtil.genRamdomStr(6);
//				System.out.println("stupsw: " + stupsw);
//				String stupswRege = "^[A-Za-z0-9]{6,10}$";
//				if (stupsw == null || stupsw.trim().length() == 0 || !stupsw.matches(stupswRege)) {
//				errorMsgs.put("stupsw", "密碼: 只能是大寫或小寫英文字母和數字 , 且長度必需在6到10之間");
//				}
//
//				String stumail = req.getParameter("stumail").trim();
//				System.out.println("stumail: " + stumail);
//				String stumailRege = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
//				if (stumail == null || stumail.trim().length() == 0 || !stumail.matches(stumailRege)) {
//					errorMsgs.put("stumail", "信箱:必需包含@，且@前必需含字母(2~15個)，@後可以是字母或(和)數字(至少3個)，.後至少兩個小寫字母");
//				}
//
//				String stutel = req.getParameter("stutel").trim();
//				System.out.println("stutel: " + stutel);
//				String stutelRege = "/^09[0-9]{8}$/";
//				if (stutel == null || stutel.trim().length() == 0 || !stutel.matches(stutelRege)) {
//					errorMsgs.put("stutel", "電話:必需是09開頭且後方接著0-9，共10個數字");
//				}
//
//				InputStream picIn = null;
//				byte[] stupic = new byte[0];
//				try {
//					Part picPart = req.getPart("stupic");
//					picIn = picPart.getInputStream();
//					stupic = new byte[picIn.available()];
//					picIn.read(stupic);
//				} catch (NullPointerException e) {
//					errorMsgs.put("stupic", "請上傳一張照片！");
//				} finally {
//					picIn.close();
//				}
//
//				String stusex = req.getParameter("stusex");
//				System.out.println("stusex: " + stusex);
//
//				String zipcode = req.getParameter("zipcode").trim();
//				String city = req.getParameter("city").trim();
//				String town = req.getParameter("town").trim();
//				String stuadd = req.getParameter("stuadd");
//				stuadd = zipcode + city + town + stuadd;
//				System.out.println("stuadd: " + stuadd);
//				if (stuadd == null || stuadd.trim().length() == 0) {
//					errorMsgs.put("stuadd", "請輸入詳細地址");
//				}
//
//				java.sql.Date stubir = null;
//				try {
//				String stubir = req.getParameter("stubir");
//				} catch (IllegalArgumentException e) {
//					stubir = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.put("stubir", "請輸入日期!");
//				}
//
//				/*************************** 2.開始更新資料 ***************************************/
//				StuService stuSvc = new StuService();
//				String stuno = req.getParameter("stuno").trim();
//				StuVO stuVO = stuSvc.getOneStu(stuno);
//				stuSvc.updateStu(stuno, stuname, stuVO.getStupsw(), stuadd, stubir, stumail, stutel,
//						stuVO.getStupoint(), stuVO.getStusta(), stupic, stusex);
//
////						MailUtil mailUtil = new MailUtil();
////						mailUtil.sendMail(stumail, "Sign Up success!", "your password is " + stupsw);
//
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/front-end/student/updateStudent.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				e.printStackTrace();
//				errorMsgs.put("other errors", e.getMessage());
//				req.setAttribute("errorMsgs", errorMsgs);
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/student/updateStudent.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}
}
