package com.sale_list_model;

import java.util.List;


public interface Sale_listDAO_interface {
	public void insert(Sale_listVO sale_listVO);
	public void update(Sale_listVO sale_listVO);
	public void delete(Integer sa_pro_no);
	public Sale_listVO findByPrimaryKey(Integer sa_pro_no);
	public List<Sale_listVO>getAll();
}
