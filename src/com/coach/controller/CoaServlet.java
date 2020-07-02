package com.coach.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONObject;

import com.coach.model.CoaService;
import com.coach.model.CoaVO;
import com.expertise.model.ExpService;
import com.expertise.model.ExpVO;
import com.expertise_own.model.ExpOwnService;
import com.expertise_own.model.ExpOwnVO;
import com.utils.MailUtil;
import com.utils.StringUtil;

import sun.misc.BASE64Encoder;

@MultipartConfig
public class CoaServlet extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		try {
			CoaService coaSvc = new CoaService();
			ExpService expService = new ExpService();
			ExpOwnService expOwnService = new ExpOwnService();
			List<CoaVO> list = coaSvc.getAll();

			JSONArray jsonArray = new JSONArray();
			for (CoaVO coaVO : list) {
				JSONObject jSONObject = new JSONObject();
				jSONObject.put("coano", coaVO.getCoano());
				jSONObject.put("coaname", coaVO.getCoaname());
				jSONObject.put("coapsw", coaVO.getCoapsw());
				jSONObject.put("coamail", coaVO.getCoamail());
				jSONObject.put("coatel", coaVO.getCoatel());
				jSONObject.put("coaacc", coaVO.getCoaacc());
				jSONObject.put("coapoint", coaVO.getCoapoint());
				jSONObject.put("coasta", coaVO.getCoasta());
				jSONObject.put("coapic", coaVO.getCoapic());
				jSONObject.put("coasex", coaVO.getCoasex());
				jSONObject.put("coaintro", coaVO.getCoaintro());
				jSONObject.put("coasctotal", coaVO.getCoasctotal());
				jSONObject.put("coascqty", coaVO.getCoascqty());
				List<String> expdescs = new ArrayList<String>();
				List<ExpOwnVO> expOwnVOs = expOwnService.getExpOwnsByCoano(coaVO.getCoano());
				for (ExpOwnVO expOwnVO : expOwnVOs) {
					ExpVO expVO = expService.getOneExp(expOwnVO.getExpno());
					expdescs.add(expVO.getExpdesc());
				}
				jSONObject.put("expdescs", expdescs);
				jsonArray.put(jSONObject);
			}
			out.print(jsonArray.toString());
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// 新增一筆教練資料
		if ("insert".equals(action)) { // 來自addCoach.jsp的請求
			Map<String, String> errorMsgs = new HashMap<String, String>();
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String coaname = req.getParameter("coaname").trim();
				System.out.println("coaname: " + coaname);
				String coanameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (coaname == null || coaname.trim().length() == 0) {
					errorMsgs.put("coaname", "教練姓名: 請勿空白");
				} else if (!coaname.trim().matches(coanameReg)) {
					errorMsgs.put("coaname", "教練姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String coapsw = StringUtil.genRamdomStr(6);
				System.out.println("coapsw: " + coapsw);
//				String coapswRege = "^[A-Za-z0-9]{6,10}$";
//				if (coapsw == null || coapsw.trim().length() == 0) {
//					errorMsgs.put("coapsw", "密碼: 只能是大寫或小寫英文字母和數字 , 且長度必需在6到10之間");
//				}

				String coamail = req.getParameter("coamail").trim();
				System.out.println("coamail: " + coamail);
				String coamailRege = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
				if (coamail == null || coamail.trim().length() == 0) {
					errorMsgs.put("coamail", "信箱:必需包含@，且@前必需含字母(2~15個)，@後可以是字母或(和)數字(至少3個)，.後至少兩個小寫字母");
				}

				String coatel = req.getParameter("coatel").trim();
				System.out.println("coatel: " + coatel);
				String coatelRege = "/^09[0-9]{8}$/";
				if (coatel == null || coatel.trim().length() == 0) {
					errorMsgs.put("coatel", "電話:必需是09開頭且後方接著0-9，共八個數字");
				}

				String coaacc = req.getParameter("coaacc").trim();
				System.out.println("coaacc: " + coaacc);
				String coaaccRege = "/^[0-9]{12,14}$/";
				if (coaacc == null || coaacc.trim().length() == 0) {
					errorMsgs.put("coaacc", "帳戶:0-9的數字，12~14個數字");
				}

				InputStream picIn = null;
				byte[] coapic = new byte[0];
				try {
					Part picPart = req.getPart("coapic");
					picIn = picPart.getInputStream();
					coapic = new byte[picIn.available()];
					picIn.read(coapic);
				} catch (NullPointerException e) {
					errorMsgs.put("coapic", "請上傳一張照片！");
				} finally {
					picIn.close();
				}

				String coasex = req.getParameter("coasex");
				System.out.println("coasex: " + coasex);

				String coaintro = req.getParameter("coaintro").trim();
				System.out.println("coaintro: " + coaintro);
				if (coaintro == null || coaintro.trim().length() == 0) {
					errorMsgs.put("coaintro", "請輸入內容！");
				}

				// TODO Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {// 如果有任何錯誤訊息
					CoaVO coaVO = new CoaVO();

					coaVO.setCoaname(coaname);
					coaVO.setCoapsw(coapsw);
					coaVO.setCoamail(coamail);
					coaVO.setCoatel(coatel);
					coaVO.setCoaacc(coaacc);
					coaVO.setCoapic(coapic);
					coaVO.setCoasex(coasex);
					coaVO.setCoaintro(coaintro);

					req.setAttribute("coaVO", coaVO); // 含有輸入格式錯誤的coaVO物件,也存入req，左邊的coaVO來自addCoach.jsp的第6行，第6行跟第8行有關，而第8行跟第100行有關
					req.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coach/addCoach.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				CoaService coaSvc = new CoaService();
				String coano = coaSvc.addCoa(coaname, coapsw, coamail, coatel, coaacc, coapic, coasex, coaintro);

				ExpOwnService expOwnService = new ExpOwnService();
				Integer expNumber = 1;
				while (req.getParameter("expno" + expNumber.toString()) != null) {
					// insert expown
					String expno = req.getParameter("expno" + expNumber.toString());
					Part expownPart = req.getPart("expown" + expNumber.toString());
					InputStream expownIn = expownPart.getInputStream();
					byte[] expown = new byte[expownIn.available()];
					expownIn.read(expown);
					expownIn.close();
					expOwnService.addExpOwn(coano, expno, expown);
					expNumber++;
				}

				MailUtil mailUtil = new MailUtil();
				mailUtil.sendMail(coamail, "Sign Up success!", "your password is " + coapsw);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("other errors", e.getMessage());
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coach/addCoach.jsp");
				failureView.forward(req, res);
			}
		}
		// 修改頁面展示一筆教練資料 for back-end
		else if ("BackendGetOneForUpdate".equals(action) || "BackendGetOneForView".equals(action)) { // 來自listAllCoach.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String coano = (String) req.getParameter("coano");

				/*************************** 2.開始查詢資料 ****************************************/
				// get coach data
				BASE64Encoder encoder = new BASE64Encoder();
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getOneCoa(coano);
				coaVO.setCoapicStr(encoder.encode(coaVO.getCoapic()));

				// get expertise data
				ExpOwnService expOwnService = new ExpOwnService();
				List<ExpOwnVO> expOwnVOs = expOwnService.getExpOwnsByCoano(coano);
				ExpService expService = new ExpService();
				for (ExpOwnVO expOwnVO : expOwnVOs) {
					ExpVO expVO = expService.getOneExp(expOwnVO.getExpno());
					expOwnVO.setExpdesc(expVO.getExpdesc());

					// encode bytes to base64 for display purpose
					expOwnVO.setExpownStr(encoder.encode(expOwnVO.getExpown()));
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("coaVO", coaVO); // 資料庫取出的coaVO物件,存入req
				req.setAttribute("expOwnVOs", expOwnVOs);
				
				//為課表加
				HttpSession session = req.getSession();
				session.setAttribute("coano", coaVO.getCoano());
				
				String url = "BackendGetOneForView".equals(action) ? "/front-end/coach/listOneCoach_ForStudent.jsp"
						: "/back-end/coach/listOneCoach.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				String url = "BackendGetOneForView".equals(action) ? "/front-end/coach/listAllCoach_ForStudent.jsp"
						: "/back-end/coach/listAllCoach.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}
		// for ajax
		else if ("BackendUpdate".equals(action)) {
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			String coano = (String) req.getParameter("coano");
			String coasta = (String) req.getParameter("coasta");
			try {
				CoaService coaSvc = new CoaService();
				CoaVO coaVO = coaSvc.getOneCoa(coano);
				coaSvc.updateCoa(coano, coaVO.getCoaname(), coaVO.getCoapsw(), coaVO.getCoamail(), coaVO.getCoatel(),
						coaVO.getCoaacc(), coaVO.getCoapoint(), coasta, coaVO.getCoapic(), coaVO.getCoasex(),
						coaVO.getCoaintro(), coaVO.getCoasctotal(), coaVO.getCoascqty());
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("error_code", "0");
				out.print(jsonObject.toString());
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				out.close();
			}
		}
		// for submit form
		else if ("update".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String coaname = req.getParameter("coaname").trim();
				System.out.println("coaname: " + coaname);
				String coanameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (coaname == null || coaname.trim().length() == 0) {
					errorMsgs.put("coaname", "教練姓名: 請勿空白");
				} else if (!coaname.trim().matches(coanameReg)) {
					errorMsgs.put("coaname", "教練姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

//				String coapsw = StringUtil.genRamdomStr(6);
//				System.out.println("coapsw: " + coapsw);
//				String coapswRege = "^[A-Za-z0-9]{6,10}$";
//				if (coapsw == null || coapsw.trim().length() == 0 || !coapsw.matches(coapswRege)) {
//					errorMsgs.put("coapsw", "密碼: 只能是大寫或小寫英文字母和數字 , 且長度必需在6到10之間");
//				}

				String coamail = req.getParameter("coamail").trim();
				System.out.println("coamail: " + coamail);
				String coamailRege = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
				if (coamail == null || coamail.trim().length() == 0 || !coamail.matches(coamailRege)) {
					errorMsgs.put("coamail", "信箱:必需包含@，且@前必需含字母(2~15個)，@後可以是字母或(和)數字(至少3個)，.後至少兩個小寫字母");
				}

				String coatel = req.getParameter("coatel").trim();
				System.out.println("coatel: " + coatel);
				String coatelRege = "/^09[0-9]{8}$/";
				if (coatel == null || coatel.trim().length() == 0 || !coatel.matches(coatelRege)) {
					errorMsgs.put("coatel", "電話:必需是09開頭且後方接著0-9，共10個數字");
				}

				String coaacc = req.getParameter("coaacc").trim();
				System.out.println("coaacc: " + coaacc);
				String coaaccRege = "/^[0-9]{12,14}$/";
				if (coaacc == null || coaacc.trim().length() == 0 || !coaacc.matches(coaaccRege)) {
					errorMsgs.put("coaacc", "帳戶:0-9的數字，12~14個數字");
				}

				InputStream picIn = null;
				byte[] coapic = new byte[0];
				try {
					Part picPart = req.getPart("coapic");
					picIn = picPart.getInputStream();
					coapic = new byte[picIn.available()];
					picIn.read(coapic);
				} catch (NullPointerException e) {
					errorMsgs.put("coapic", "請上傳一張照片！");
				} finally {
					picIn.close();
				}

				String coasex = req.getParameter("coasex");
				System.out.println("coasex: " + coasex);

				String coaintro = req.getParameter("coaintro").trim();
				System.out.println("coaintro: " + coaintro);
				if (coaintro == null || coaintro.trim().length() == 0) {
					errorMsgs.put("coaintro", "請輸入內容！");
				}

//				// TODO Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {// 如果有任何錯誤訊息
//					CoaVO coaVO = new CoaVO();
//
//					coaVO.setCoaname(coaname);
//					coaVO.setCoamail(coamail);
//					coaVO.setCoatel(coatel);
//					coaVO.setCoaacc(coaacc);
//					coaVO.setCoapic(coapic);
//					coaVO.setCoasex(coasex);
//					coaVO.setCoaintro(coaintro);
//
//					req.setAttribute("coaVO", coaVO); // 含有輸入格式錯誤的coaVO物件,也存入req，左邊的coaVO來自addCoach.jsp的第6行，第6行跟第8行有關，而第8行跟第100行有關
//					req.setAttribute("errorMsgs", errorMsgs);
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coach/addCoach.jsp");
//					failureView.forward(req, res);
//					return;
//				}

				/*************************** 2.開始更新資料 ***************************************/
				CoaService coaSvc = new CoaService();
				String coano = req.getParameter("coano").trim();
				CoaVO coaVO = coaSvc.getOneCoa(coano);
				coaSvc.updateCoa(coano, coaname, coaVO.getCoapsw(), coamail, coatel, coaacc, coaVO.getCoapoint(),
						coaVO.getCoasta(), coapic, coasex, coaintro, coaVO.getCoasctotal(), coaVO.getCoascqty());

//				ExpOwnService expOwnService = new ExpOwnService();
//				Integer expNumber = 1;
//				while (req.getParameter("expno" + expNumber.toString()) != null) {
//					// insert expown
//					String expno = req.getParameter("expno" + expNumber.toString());
//					Part expownPart = req.getPart("expown" + expNumber.toString());
//					InputStream expownIn = expownPart.getInputStream();
//					byte[] expown = new byte[expownIn.available()];
//					expownIn.read(expown);
//					expownIn.close();
//					expOwnService.addExpOwn(coano, expno, expown);
//					expNumber++;
//				}

//				MailUtil mailUtil = new MailUtil();
//				mailUtil.sendMail(coamail, "Sign Up success!", "your password is " + coapsw);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/coach/updateCoach.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("other errors", e.getMessage());
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coach/updateCoach.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne".equals(action)) {
			
			String coano = req.getParameter("coano");
			CoaService coaSvc = new CoaService();
			CoaVO coaVO = coaSvc.getOneCoa(coano);
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/*************************** 2.開始查詢資料 ****************************************/
				// get coach data
				BASE64Encoder encoder = new BASE64Encoder();
				
				coaVO.setCoapicStr(encoder.encode(coaVO.getCoapic()));

				// get expertise data
				ExpOwnService expOwnService = new ExpOwnService();
				List<ExpOwnVO> expOwnVOs = expOwnService.getExpOwnsByCoano(coano);
				ExpService expService = new ExpService();
				for (ExpOwnVO expOwnVO : expOwnVOs) {
					ExpVO expVO = expService.getOneExp(expOwnVO.getExpno());
					expOwnVO.setExpdesc(expVO.getExpdesc());

					// encode bytes to base64 for display purpose
					expOwnVO.setExpownStr(encoder.encode(expOwnVO.getExpown()));
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("coaVO", coaVO); // 資料庫取出的coaVO物件,存入req
				req.setAttribute("expOwnVOs", expOwnVOs);
				
				//為課表加
				HttpSession session = req.getSession();
				session.setAttribute("coano", coaVO.getCoano());
				
				String url = "/front-end/coach/listOneCoach_ForStudent.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				String url = "BackendGetOneForView".equals(action) ? "/front-end/coach/listAllCoach_ForStudent.jsp"
						: "/back-end/coach/listAllCoach.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
		}
	}
}}
