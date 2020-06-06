package com.product_order.model;

import java.util.List;

import com.product_order.model.Product_orderVO;

public interface Product_orderDAO_interface {
	public void insert (Product_orderVO product_orderVO);
	public void update(Product_orderVO product_orderVO);
	public void delete(Integer pordno);
	public Product_orderVO findByPrimaryKey(Integer pordno);
	public List<Product_orderVO>getAll();
}
