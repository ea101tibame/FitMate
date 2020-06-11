package com.activity_fav.model;

import java.util.List;

public class Activity_FavService {
	private Activity_favDAO_interface dao;
	
	public Activity_FavService() {
		dao = new Activity_favDAO() ; 
	}
	
	//新增
	public Activity_favVO addActivityFav(String actno,String stuno) {
		Activity_favVO act_favVO = new Activity_favVO();
		act_favVO.setActno(actno);
		act_favVO.setStuno(stuno);
		dao.insert(act_favVO);
		return act_favVO;
	}
	
	//修改
	public Activity_favVO updateActivityFav(String actno,String stuno) {
		Activity_favVO act_favVO = new Activity_favVO();
		act_favVO.setActno(actno);
		act_favVO.setStuno(stuno);
		dao.update(act_favVO);
		return act_favVO;
	}
	
	//刪除
	public void deleteActivityFav(String actno,String stuno) {
		dao.delete(actno,stuno);
	}
	//活動編號單一查詢找學員
	public List<Activity_favVO> findStudentByPrimaryKey(String actno){
		return dao.findStudentByPrimaryKey(actno);
		
	}
	
	//學員單一查詢找活動
	public List<Activity_favVO> findActivityByPrimaryKey(String stuno){
		return dao.findActivityByPrimaryKey(stuno);
		
	}
	
	// 全部查詢
	public List<Activity_favVO> getAllActivityFav(){
		return dao.getAll();
		
	}
}
