package com.sale_list_model;

import java.util.List;

import com.sale_project.model.Sale_projectVO;


public interface Sale_listDAO_interface {
	public void insert(Sale_listVO sale_listVO);
	public void update(Sale_listVO sale_listVO);
	public void delete(String sapro_no,String prodno);
	public List<Sale_listVO> findBySaprono(String sapro_no);
	public List<Sale_listVO>getAll();
	public void insert2(Sale_listVO sale_listVO,java.sql.Connection con);
}
