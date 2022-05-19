<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<%!// 변수, 메소드 선언 
		String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	<!-- p-5 : paddind max(3이 보통) / bg-primary : 기본색상 background / text-white : text 하얀색 -->
	<div class="mb-4 p-5 bg-primary text-white">
		<!-- container : 좌우 가운데 정렬 -->
		<div class="container">
			<!-- display-3 : 큰 글자중 보통크기 -->
			<h1 class="display-3"><%=greeting%></h1>
		</div>
	</div>

	<main role="main">
		<div class="container">
			<div class="text-center">
				<h3><%=tagline%></h3>
				<%
					// 초당 한번씩 메인페이지 새로고침
					response.setIntHeader("Refresh", 1);
					Date today = new Date();
					SimpleDateFormat df = new SimpleDateFormat("hh:mm:ss a");
					out.println("현재 접속 시간: " + df.format(today));
				%>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>