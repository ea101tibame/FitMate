package com.activity.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.activity.model.ActivityService;
import com.activity.model.ActivityVO;

@WebServlet("/ScheduleServletact")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Timer timer = new Timer();

	public ScheduleServlet() {
		super();

	}

	public void init() {
		TimerTask task = new TimerTask() {
			public void run() {
				System.out.println("工作排定的時間= " + new Date(scheduledExecutionTime()));
				System.out.println("已建立排程");

				ActivityService activitySvc = new ActivityService();
				List<ActivityVO> list = activitySvc.getAllActivity();

				java.util.Date date = new java.util.Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today = sdf.format(date);

				System.out.println("today=" + today);
				for (int i = 0; i < list.size(); i++) {
					java.sql.Date actend = list.get(i).getActend();
					System.out.println("第" + i + "actend=" + actend);
					// 截止日與今天一樣
					if (actend.toString().equals(today)) {
						System.out.println("截止日與今日一樣");
						// 狀態還是上架未成團
						if (list.get(i).getActsta().equals("上架未成團")) {
							System.out.println("第" + i + "list.get(i).getActsta()=" + list.get(i).getActsta());
							System.out.println("狀態又是上架未成團");
							// 下架
							activitySvc.update_sta_auto(list.get(i).getActno());
							System.out.println("下架成功");
						}
					}

				}
			}
		};
		// 從2020 6 21 開始每天0:0:0 執行 這個排程
		Calendar cal = new GregorianCalendar(2020, Calendar.JUNE, 20, 0, 0, 0);
		timer.scheduleAtFixedRate(task, cal.getTime(), 24 * 60 * 60 * 1000);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

	public void destroy() {
		timer.cancel();
		System.out.println("已移除排程!");
	}

}
