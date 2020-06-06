package com.product_order_list.model;

import java.util.List;


public interface Product_order_listDAO_interface {
	public void insert(Product_order_listVO product_order_listVO);
	public void update(Product_order_listVO product_order_listVO);
	public void delete(Integer p_or_no);
	public Product_order_listVO findByPrimaryKey(Integer p_or_no);
	public List<Product_order_listVO>getAll();
}
