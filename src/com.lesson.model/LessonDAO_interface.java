package com.lesson.model;

import java.util.*;

import org.json.JSONArray;

public interface LessonDAO_interface {
	public void insert(LessonVO lessonVO);
	public void update(LessonVO lessonVO);//�Ƶ�:�S���R�� �u�ܧ󪬺A���U�[
	/*�������d�߽ҵ{*/
	public LessonVO findLessonByLessonType(String lesstype);
	/*�d�ߥ����ҵ{ �ҵ{�`��*/
	public List<LessonVO>getAll();
	/*�d�߬Y�нm���ҵ{��T(�@��h)(�^�Ǥ@�� JSONArray ��J�Ҫ��)*/
	public JSONArray getCoachAllLesson(String coano);
}
