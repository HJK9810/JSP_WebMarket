<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository reposiory = ProductRepository.getInstance();
	Product product = reposiory.getProductById(id);
	
	List<Product> goodsList = reposiory.getAllProducts();
	Product nowGoods = new Product();
	for (Product goods : goodsList) {
		nowGoods = goods;
		if (nowGoods.getProductId().equals(id)) break;
	}
	
	List<Product> list = (List<Product>) session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	int count = 0;
	Product goodsQnt = new Product();
	
	for (Product goods : list) {
		goodsQnt = goods;
		if (goodsQnt.getProductId().equals(id)) {
			count++;
			int orderQuntity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuntity);
		}
	}
	
	if (count == 0) {
		nowGoods.setQuantity(1);
		list.add(nowGoods);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
%>
