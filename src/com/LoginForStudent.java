package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.student.model.StuService;
import com.student.model.StuVO;

@WebServlet("/loginForStudent.do")
public class LoginForStudent extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		// 【取得使用者 帳號(stumail) 密碼(stupsw)】
		String stumail = req.getParameter("stumail");
		String stupsw = req.getParameter("stupsw");
		System.out.println(String.format("student login: stumail: %s, stupsw: %s", stumail, stupsw));

		StuService stuService = new StuService();
		StuVO stuVO = stuService.getStuByMailNPsw(stumail, stupsw);

		// 【檢查該帳號 , 密碼是否有效】
		if (stuVO == null) { // 【帳號 , 密碼無效時】
			out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
			out.println("<BODY>你的帳號或密碼無效!<BR>");
			out.println("請按此重新登入 <A HREF=" + req.getContextPath() + "/front-end/index.jsp>重新登入</A>");
			out.println("</BODY></HTML>");
		} else { // 【帳號 , 密碼有效時, 才做以下工作】
			// *工作1: 才在session內做已經登入過的標識
			HttpSession session = req.getSession();
			session.setAttribute("stuno", stuVO.getStuno());
			session.setAttribute("stuname", stuVO.getStuname());
			session.setAttribute("role", "student");
			session.setAttribute("stuVO", stuVO);

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