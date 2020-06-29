package com.lessonTime.model;

import java.util.List;

import org.json.JSONArray;

import com.lessonDetail.model.LessonDetailVO;


public interface LessonTimeDAO_inrterface {
	
	public void insert(LessonTimeVO LessonTimeVO,String lessno);
	
	public void update(LessonTimeVO LessonTimeVO);
	 
	public void delete(String lessno);
	
	//查單筆 時段
	public List<LessonTimeVO> findByPrimaryKey(String lessno);
	
	public List<LessonTimeVO> getAll();
	//查詢此教練 所有課程與所有時段 送JSONArray到servlet去比對
	public  JSONArray getCoachAllLesson(String coano);
	
	public List<String> getOneTime(String lessno);
	
}
