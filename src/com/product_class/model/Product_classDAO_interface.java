package com.product_class.model;

import java.util.List;

public interface Product_classDAO_interface {

	public void insert(Product_classVO product_classVO);
	public void update(Product_classVO product_classVO);
	public void delete(Integer pclass_id);
	public Product_classVO findByPrimaryKey(Integer pclass_id);
	public List<Product_classVO>getAll();
}
