<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
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
	
	List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
	
	Product goodsQnt = new Product();
	
	for (Product goods : cartList) {
		goodsQnt = goods;
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>