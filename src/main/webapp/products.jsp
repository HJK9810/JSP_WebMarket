<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<!-- class를 id라는 이름으로 사용하겠다는 의미 / session : 서버측에 저장 -->
<jsp:useBean id="repository" class="dao.ProductRepository"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		List<Product> products = repository.getAllProducts();
		for (Product product : products) {
			out.println(product + "<br><br>");
		}
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>