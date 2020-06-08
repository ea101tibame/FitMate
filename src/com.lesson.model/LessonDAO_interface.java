package com.lesson.model;

import java.util.*;

import org.json.JSONArray;

public interface LessonDAO_interface {
	public void insert(LessonVO lessonVO);
	public void update(LessonVO lessonVO);//備註:沒有刪除 只變更狀態為下架
	/*用類型查詢課程*/
	public LessonVO findLessonByLessonType(String lesstype);
	/*查詢全部課程 課程總覽*/
	public List<LessonVO>getAll();
	/*查詢某教練的課程資訊(一對多)(回傳一串 JSONArray 放入課表用)*/
	public JSONArray getCoachAllLesson(String coano);
}
