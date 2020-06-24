package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coach.model.CoaService;
import com.coach.model.CoaVO;

@WebServlet("/loginForCoach.do")
public class LoginForCoach extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		// 【取得使用者 帳號(coamail) 密碼(coapsw)】
		String coamail = req.getParameter("coamail");
		String coapsw = req.getParameter("coapsw");
		System.out.println(String.format("coach login: coamail: %s, coapsw: %s", coamail, coapsw));

		CoaService coaService = new CoaService();
		CoaVO coaVO = coaService.getCoaByMailNPsw(coamail, coapsw);

		// 【檢查該帳號 , 密碼是否有效】
		if (coaVO == null) { // 【帳號 , 密碼無效時】
			out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
			out.println("<BODY>你的帳號或密碼無效!<BR>");
			out.println("請按此重新登入 <A HREF=" + req.getContextPath() + "/front-end/index.jsp>重新登入</A>");
			out.println("</BODY></HTML>");
		} else { // 【帳號 , 密碼有效時, 才做以下工作】
			// *工作1: 才在session內做已經登入過的標識
			HttpSession session = req.getSession();
			session.setAttribute("coano", coaVO.getCoano());
			session.setAttribute("coaname", coaVO.getCoaname());
//			session.setAttribute("coapsw", coaVO.getCoapsw());
//			session.setAttribute("coamail", coaVO.getCoamail());
//			session.setAttribute("coatel", coaVO.getCoatel());
			session.setAttribute("coaacc", coaVO.getCoaacc());
			session.setAttribute("coasta", coaVO.getCoasta());
			session.setAttribute("coapoint", coaVO.getCoapoint());
			session.setAttribute("coasex", coaVO.getCoasex());
			session.setAttribute("coaintro", coaVO.getCoaintro());
			session.setAttribute("coasctotal", coaVO.getCoasctotal());
			session.setAttribute("coascqty", coaVO.getCoascqty());
//			session.setAttribute("coapic", coaVO.getCoapic());

			session.setAttribute("role", "coach");
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
			} catch (Exception ignored) {
			}

			res.sendRedirect(req.getContextPath() + "/front-end/index.jsp"); // *工作3: (-->如無來源網頁:則重導至login_success.jsp)
		}
	}
}