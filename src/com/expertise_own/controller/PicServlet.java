package com.expertise_own.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coach.model.CoaService;
import com.coach.model.CoaVO;
import com.expertise_own.model.ExpOwnService;
import com.expertise_own.model.ExpOwnVO;

public class PicServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			String expno = req.getParameter("expno");
			String coano = req.getParameter("coano");
			ExpOwnService ExpOwnSvc = new ExpOwnService();
			ExpOwnVO expownVO = ExpOwnSvc.getOneExpOwn(expno, coano);
			byte[] buf = expownVO.getExpown();
			out.write(buf);
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/images/noData/null2.jpg/");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}
}
