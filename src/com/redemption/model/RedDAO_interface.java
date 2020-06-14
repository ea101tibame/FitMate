package com.redemption.model;

import java.util.List;

public interface RedDAO_interface {
	
	public void insert(RedVO redVO);

	public RedVO findByPrimaryKey(String redno);

	public List<RedVO> getAll();
}
