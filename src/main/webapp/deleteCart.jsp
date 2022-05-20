<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	session.invalidate();
	
	response.sendRedirect("cart.jsp");
%>