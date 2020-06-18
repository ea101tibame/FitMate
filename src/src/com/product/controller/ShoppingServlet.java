package com.product.controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.*;
import com.product_order_list.model.*;


public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ShoppingServlet() {
        super();

    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session =req.getSession();
		
		@SuppressWarnings("unchecked")
		Vector<ProductVO>buylist = (Vector<ProductVO>)session.getAttribute("shoppingcart");
		String action=req.getParameter("action");
		
		if(!action.equals("CHECKOUT")) {
			//刪除購物車商品
			if(action.equals("DELETE")) {
				String del = req.getParameter("del");
				int d =Integer.parseInt(del);
				buylist.remove(d);
			}
			//新增商品進購物車
			else if(action.equals("ADD")) {
				boolean match = false;
				//取得後來新增的商品
				ProductVO aproduct = getProductVO(req);
				//新增第一個商品至購物車
				if(buylist==null) {
					buylist = new Vector<ProductVO>();
					buylist.add(aproduct);
				}else {
					for(int i=0;i<buylist.size();i++) {
						ProductVO productVO = buylist.get(i);
				//如果新增的書籍和購物車的書籍一樣時
						if(productVO.getProdname().equals(aproduct.getProdname())) {
//							Product_order_listService pordlistSvc = new Product_order_listService();
							
							productVO.setPord_listqty(productVO.getPord_listqty()+aproduct.getPord_listqty());
							buylist.setElementAt(productVO, i);
							match=true;
						}
					}
				}if(!match)
					buylist.add(productVO);
			}
		}
		
	}


	private ProductVO getProductVO(HttpServletRequest req) {
		String prodname=req.getParameter("prodname");
		String prodprice=req.getParameter("prodprice");
		String prodpic=req.getParameter("prodprice");
		String 
		return null;
	}

}
