<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
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
	<div class="mb-4 p-5 bg-primary text-white">
		<!-- container : 좌우 가운데 정렬 -->
		<div class="container">
			<!-- display-3 : 큰 글자중 보통크기 -->
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
	out.println(session.getAttribute("name"));
	out.println(session.getAttribute("age"));
	
	ProductRepository repository = ProductRepository.getInstance();
	List<Product> products = repository.getAllProducts();
	%>
	<div class="container">
		<div class="row text-center">
			<%
				for (int i = 0; i < products.size(); i++) {
					Product product = products.get(i);
			%>
			<div class="col-md-4">
				<h3><%=product.getProductName()%></h3>
				<p class="text-start"><%=product.getDescription()%></p>
				<p><%=product.getUnitPrice()%> 원</p>
				<p>
					<a class="btn btn-secondary" role="button"
						href="./product.jsp?id=<%=product.getProductId()%>">상세 정보 &raquo;></a>
				</p>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>