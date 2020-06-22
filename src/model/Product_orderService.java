package com.product_order.model;

import java.sql.Date;
import java.util.List;

public class Product_orderService {

	private Product_orderDAO_interface dao;
	
	public Product_orderService() {
		dao=new Product_orderJDBCDAO();
	}
	
	public Product_orderVO addPo(String stuno,Date porddate,Integer pordtotal,String pordadd,String pordsta,Integer fare) {
		Product_orderVO poVO = new Product_orderVO();
		
	
		poVO.setStuno(stuno);
		poVO.setPorddate(porddate);
		poVO.setPordtotal(pordtotal);
		poVO.setPordadd(pordadd);
		poVO.setPordsta(pordsta);
		poVO.setFare(fare);
		dao.insert(poVO);
		
		return poVO;
	}
	
	public Product_orderVO updatePo(String pordno,String stuno,Integer pordtotal,String pordadd,String pordsta,Integer fare) {
		Product_orderVO poVO = new Product_orderVO();
		
		poVO.setPordno(pordno);
		poVO.setStuno(stuno);
		poVO.setPordtotal(pordtotal);
		poVO.setPordadd(pordadd);
		poVO.setPordsta(pordsta);
		poVO.setFare(fare);
		dao.update(poVO);
		return poVO;
	}
	
	public void deletePo(String pordno) {
		dao.delete(pordno);
	}
	
	public Product_orderVO getOnePo(String pordno) {
		return dao.findByPrimaryKey(pordno);		
	}
	
	public List<Product_orderVO>getAll(){
		return dao.getAll();
	}
	
	


}
