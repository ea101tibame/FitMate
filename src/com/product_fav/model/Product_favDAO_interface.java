package com.product_fav.model;

import java.util.List;


public interface Product_favDAO_interface {
	public void insert(Product_favVO product_favVO);
	public void update(Product_favVO product_favVO);
	public void delete(Integer prodno);
	public Product_favVO findByprimaryKey(Integer prodno);
	public List<Product_favVO>getAll();
}
