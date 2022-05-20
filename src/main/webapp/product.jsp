<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script type="text/javascript">
    function addToCart() {
        if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
            document.addForm.submit();
        } else {
            document.addForm.reset();
        }
    }
</script>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="mb-4 p-5 bg-primary text-white">
		<!-- container : 좌우 가운데 정렬 -->
		<div class="container">
			<!-- display-3 : 큰 글자중 보통크기 -->
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		ProductRepository repository = ProductRepository.getInstance();
		// product.jsp?id=상품아이디 이런식으로 넘어온 id값 받기
		String id = request.getParameter("id");
		Product product = repository.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%=product.getProductName()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					<b>상품코드 : </b><span class="badge bg-danger"><%=product.getProductId()%></span>
				</p>
				<p>
					<b>제조사 : </b><%=product.getManufacturer()%>
				</p>
				<p>
					<b>분류 : </b><%=product.getCategory()%>
				</p>
				<p>
					<b>재고 수 : </b><%=product.getUnitsInStock()%>
				</p>
				<h4><%=product.getUnitPrice()%>원</h4>
				<p>
					<form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a> 
						<a href="./cart.jsp" class="btn btn-warning"> 상품 목록 &raquo;</a>
						<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>