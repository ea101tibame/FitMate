package com.authority.model;

import java.util.List;

public interface AuthorityDAO_interface {
	
	//系統管理員可操作功能(編號)
	public List<AuthorityVO> selectAllFuncSys(); 
	//一般管理員可操作功能(編號)
	public List<AuthorityVO> selectAllFuncNor(); 
	
}
