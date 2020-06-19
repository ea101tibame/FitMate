package com.product.controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
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
		Vector<ShoppingVO>buylist = (Vector<ShoppingVO>)session.getAttribute("shoppingcart");
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
				ShoppingVO aproduct = getShoppingVO(req);
				//新增第一個商品至購物車
				if(buylist==null) {
					buylist = new Vector<ShoppingVO>();
					buylist.add(aproduct);
				}else {
					for(int i=0;i<buylist.size();i++) {
						ShoppingVO shoppingVO = buylist.get(i);
				//如果新增的書籍和購物車的書籍一樣時
						if(shoppingVO.getProdname().equals(aproduct.getProdname())) {
//							Product_order_listService pordlistSvc = new Product_order_listService();
							
							shoppingVO.setProdqty(shoppingVO.getProdqty()+aproduct.getProdqty());
							buylist.setElementAt(shoppingVO, i);
							match=true;
						}
					}
				if(!match)
					buylist.add(aproduct);
			}
		}
		
		session.setAttribute("shoppingcart", buylist);
		String url ="front-end/product/textshoppingcar.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, res);
		//結帳，計算購物車價錢
	}else if(action.equals("CHECKOUT")) {
			int prodtotal=0;
			for(int i =0 ;i< buylist.size();i++) {
				ShoppingVO order=buylist.get(i);
				int prodprice=order.getProdprice();
				int prodqty=order.getProdqty();
				prodtotal+=(prodprice*prodqty);		
		}
		String amount = String.valueOf(prodtotal);
		req.setAttribute("amount",amount);
		String url ="/front-end/product/testCheckout.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, res);
	}
}

	private ShoppingVO getShoppingVO(HttpServletRequest req) {
//		String stuno=req.getParameter("stuno");
		String prodname=req.getParameter("prodname");
		String prodno=req.getParameter("prodno");
		String prodprice=req.getParameter("prodprice");
//		String prodqty=req.getParameter("prodqty");
//		String prodtotal=req.getParameter("prodtotal");
		
		ShoppingVO spVO = new ShoppingVO();
		
//		spVO.setStuno(stuno);
		spVO.setProdname(prodname);
		spVO.setProdno(prodno);
		spVO.setProdprice((new Integer(prodprice)).intValue());
//		spVO.setProdqty((new Integer(prodqty)).intValue());
		return null;
	}
}
