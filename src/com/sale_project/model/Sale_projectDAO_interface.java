package com.sale_project.model;

import java.util.List;

import com.sale_project.model.Sale_projectVO;

public interface Sale_projectDAO_interface {
	public void insert(Sale_projectVO sale_projectVO);
	public void update(Sale_projectVO sale_projectVO);
	public void delete(Integer sapro_no);
	public Sale_projectVO findByPrimaryKey(Integer sapro_no);
	public List<Sale_projectVO>getAll();
}
