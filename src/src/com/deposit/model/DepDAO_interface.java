package com.deposit.model;

import java.util.List;

public interface DepDAO_interface {
	
	public void insert(DepVO depVO);

	public DepVO findByPrimaryKey(String depno);

	public List<DepVO> getAll();
}
