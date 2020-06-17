package com.product.model;

import java.util.List;

public class ProductService {

	private ProductDAO_interface dao;
	
	
	public ProductService() {
		dao = new ProductJDBCDAO();
	}
	
	public ProductVO addProd(String pclass_id,String prodname,Integer prodprice,Integer prodqty,byte[] prodpic,String proddesc,String prodsta) {
		ProductVO prodVO = new ProductVO();
		
		prodVO.setPclass_id(pclass_id);
		prodVO.setProdname(prodname);
		prodVO.setProdprice(prodprice);
		prodVO.setProdpic(prodpic);
		prodVO.setProdqty(prodqty);
		prodVO.setProddesc(proddesc);
		prodVO.setProdsta(prodsta);
		dao.insert(prodVO);
		
		return prodVO;
	}
	
	public ProductVO updateProd(String prodno,String pclass_id,String prodname,Integer prodprice,Integer prodqty,byte[] prodpic,String proddesc,String prodsta) {
		ProductVO prodVO = new ProductVO();
		
		prodVO.setProdno(prodno);
		prodVO.setPclass_id(pclass_id);
		prodVO.setProdname(prodname);
		prodVO.setProdprice(prodprice);
		prodVO.setProdpic(prodpic);
		prodVO.setProdqty(prodqty);
		prodVO.setProddesc(proddesc);
		prodVO.setProdsta(prodsta);
		dao.update(prodVO);
		return prodVO;
	}
	
	public void deleteProd(String prodno) {
		dao.delete(prodno);
	}
	
	public ProductVO getOneProd(String prodno) {
		return dao.findByPrimaryKey(prodno);
	}
	
	public List<ProductVO>getAll(){
		return dao.getAll();
	}
}
