package com.student.model;

import java.util.List;

public interface StuDAO_interface {
	
	public void insert(StuVO stuVO);

	public void update(StuVO stuVO);

	public void delete(String stuno);

	public StuVO findByPrimaryKey(String stuno);

	public List<StuVO> getAll();
}
