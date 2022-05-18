<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./welcome.jsp">Home</a>
                </div>
            </div>
        </nav>
        <%! 
        // ����, �޼ҵ� ���� 
        String greeting = "�� ���θ��� ���� ���� ȯ���մϴ�."; 
        String tagline = "Welcome to Web Market!"; 
        %> 
        <% 
        // �ܼ��� �ڹ��ڵ� 
        // out.println("Hello World"); 
        %>
        <!-- p-5 : paddind max(3�� ����) / bg-primary : �⺻���� background / text-white : text �Ͼ�� -->
        <div class="p-5 bg-primary text-white">
        	<!-- container : �¿� ��� ���� -->
            <div class="container">
            	<!-- display-3 : ū ������ ����ũ�� -->
                <h1 class="display-3"><%= greeting %></h1>
            </div>
        </div>
        
        <main role = "main">
	        <div class="container">
	            <div class="text-center">
	                <h3><%= tagline %></h3>
	                <%
	                	Date today = new Date();
	                	SimpleDateFormat df = new SimpleDateFormat("hh:mm:ss a");
	                	out.println("���� ���� �ð�: " + df.format(today));
	                %>
	            </div>
	        </div>
        </main>
        
        <footer class = "container">
        	<p>&copy; WebMarket</p>
        </footer>
</body>
</html>