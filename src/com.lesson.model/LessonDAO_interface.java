package com.lesson.model;

import java.util.*;

import org.json.JSONArray;

import test.expertise.model.ExpertiseVO;

public interface LessonDAO_interface {
	
	//新增課程同時 新增課程多筆時段 與課程明細 (交易)
	public void insert(LessonVO lessonVO, JSONArray Alldate);
	
	//新課程內容  備註:沒有刪除 只變更狀態為下架 時段更改會到時段的dao不含時段
	public void update(LessonVO lessonVO);
	
	//查單筆課程資訊 到課程詳情頁面
	public LessonVO getALessonByLessno(String lessno);
	
	/*此運動種類有多少課程 用類型查*/
	public List<LessonVO> findLessonByLessonType(String lesstype);
	
	/*查此運動類型的詳細描述 要用到EXPERTISE的VO*/
	public ExpertiseVO getExpByExpno(String expno);
	
	/*查詢全部課程 課程總覽*/
	public List<LessonVO> getAll();
	
	/*查詢某教練的課程資訊(一對多)(回傳一串 JSONArray 放入課表用)*/
	public JSONArray getCoachAllLesson(String coano);
}
