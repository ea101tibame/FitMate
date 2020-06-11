package com.activity.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.activity.model.*;

public class ActivityServlet extends HttpServlet {
       

    public ActivityServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
			doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action =req.getParameter("action");

		//新增區塊 (未有錯誤處理)
		String actname = req.getParameter("actname").trim();
		String actloc = req.getParameter("actloc").trim();
		java.sql.Date actdate = null;
		String actss = req.getParameter("actss").trim();
		java.sql.Date actstart = null;
		java.sql.Date actend = null;
		String acttype = req.getParameter("acttype").trim();
		Integer actprice = new Integer(req.getParameter("actprice").trim());
		Integer actmin = new Integer(req.getParameter("actmin"));
		Integer actmax = new Integer(req.getParameter("actmax"));
		Integer actcur = new Integer(req.getParameter("actcur"));
		String actdesc = req.getParameter("actdesc").trim();
		String actsta = req.getParameter("actsta").trim();
		Part pic = req.getPart("actpic");
		InputStream in = pic.getInputStream();
		byte[]actpic = new byte [in.available()];
		in.read(actpic);
		String stuno =req.getParameter("stuno");
		String coano = req.getParameter("coano");
		
		ActivityVO actVO = new ActivityVO();
		actVO.setActname(actname);
		actVO.setActloc(actloc);
		actVO.setActdate(actdate);
		actVO.setActss(actss);
		actVO.setActstart(actstart);
		actVO.setActend(actend);
		actVO.setActtype(acttype);
		actVO.setActprice(actprice);
		actVO.setActmin(actmin);
		actVO.setActmax(actmax);
		actVO.setActcur(actcur);
		actVO.setActdesc(actdesc);
		actVO.setActsta(actsta);
		actVO.setActpic(actpic);
		actVO.setStuno(stuno);
		actVO.setCoano(coano);
		
		req.setAttribute("actVO", actVO);
		RequestDispatcher failureView = req
				.getRequestDispatcher("/activity/addActivity.jsp");
		failureView.forward(req, res); 
		
		ActivityService actSvc = new ActivityService();
		actVO = actSvc.addActivity(actname, actloc, actdate, actss,
				actstart, actend, acttype, actprice, actmin,
				actmax, actcur, actdesc, actsta, actpic, stuno, coano);
		String url = "/activity/listAllActivity.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
		
	}

}
