package com.coach.model;

import java.util.List;

public interface CoaDAO_interface {
	
	public void insert(CoaVO coaVO);

	public void update(CoaVO coaVO);

	public void delete(String coano);

	public CoaVO findByPrimaryKey(String coano);

	public List<CoaVO> getAll();
}
