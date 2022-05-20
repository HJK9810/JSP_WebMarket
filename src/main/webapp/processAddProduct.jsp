<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
// 한글 안깨지게
	request.setCharacterEncoding("UTF-8");
	
	String productId = request.getParameter("productId");
	String productName = request.getParameter("productName");
	int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock"));
	String condition = request.getParameter("condition");
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setProductName(productName);
	newProduct.setUnitPrice(unitPrice);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(unitsInStock);
	newProduct.setCondition(condition);
	
	ProductRepository repository = ProductRepository.getInstance();
	repository.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
%>