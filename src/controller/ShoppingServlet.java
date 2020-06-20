package com.product.controller;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.*;


public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		@SuppressWarnings("unchecked")
		List<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");
		System.out.println("action="+action);

		if (!action.equals("CHECKOUT")) {

			// 刪除購物車中的書籍
			if (action.equals("DELETE")) {
				System.out.println("del");
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				buylist.remove(d);
			}
			// 新增書籍至購物車中
			else if (action.equals("ADD")) {
				// 取得後來新增的書籍
				ProductVO aproduct = getProductVO(req);

				if (buylist == null) {
					buylist = new Vector<ProductVO>();
					buylist.add(aproduct);
				} else {
					if (buylist.contains(aproduct)) {
						ProductVO innerProduct= buylist.get(buylist.indexOf(aproduct));
						innerProduct.setQty(innerProduct.getQty() + aproduct.getQty());
					} else {
						buylist.add(aproduct);
					}
				}
			}

			session.setAttribute("shoppingcart", buylist);
			String url = "/front-end/product/textshoppingcar.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

		// 結帳，計算購物車書籍價錢總數
		else if (action.equals("CHECKOUT")) {
			int prodtotal = 0;
			for (int i = 0; i < buylist.size(); i++) {
				ProductVO order = buylist.get(i);
				Integer prodprice = order.getProdprice();
				Integer qty = order.getQty();
				prodtotal += (prodprice * qty);
			}

			String amount = String.valueOf(prodtotal);
			req.setAttribute("amount", amount);
			String url = "/front-end/product/testCheckout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
	}

	private ProductVO getProductVO(HttpServletRequest req) {
		
		String prodno = req.getParameter("prodno");
		String prodname = req.getParameter("prodname");
		String prodprice = req.getParameter("prodprice");
		String qty = req.getParameter("qty");
		
		System.out.println(prodno);
		System.out.println(prodname);
		System.out.println(prodprice);
		System.out.println(qty);


		ProductVO productVO = new ProductVO();

		productVO.setProdno(prodno);
		productVO.setProdname(prodname);
		productVO.setProdprice(new Integer(prodprice));
		productVO.setQty((new Integer(qty)).intValue());
		return productVO;
	}

}
