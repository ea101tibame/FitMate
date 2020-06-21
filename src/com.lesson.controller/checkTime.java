package com.lesson.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.lesson.model.LessonService;


@WebServlet("/checkTime")
public class checkTime extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("json");
		String[] jarrdate = req.getParameterValues("jarrdate");
		System.out.println("jarrdate[0]="+jarrdate[0]);
		String[] jarrtime = req.getParameterValues("jarrtime");
		System.out.println("jarrtime[0]="+jarrtime[0]);
		
		LessonService lessonService = new LessonService();
		JSONArray checkTime = lessonService.checkTime("C001");
		 System.out.println(checkTime);
		String[] dbTimelist =null;
		 try {
			JSONObject  result = checkTime.getJSONObject(0);
			
			System.out.println("result="+result);
			String ss = result.getString("ltime_ss");
			System.out.println("ss="+ss);
			String date1= result.getString("ltime_date");
			System.out.println("date1="+date1);
			String str = date1+ss;
			System.out.println(str);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
