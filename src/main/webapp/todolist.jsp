<%@page import="java.util.List"%>
<%@ page import="dao.TodoRepository"%>
<%@ page import="dto.Todo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="./assets/css/todolist.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/form.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/todoitem.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Todo List</title>
<script>
	function setDone(id) {
		$.ajax({
            url: "processToggle.jsp",
            type: "post",
            data: { id: id },
            success: (data) => window.location.reload(),
        });
	}

	function addTodo() {
		// post 방식으로 task 전송
		const task = $("#text").val();
		
		if (task) {
            $.ajax({
                url: "processAddTodo.jsp",
                type: "post",
                data: { task: task },
                success: (data) => window.location.reload(),
            });
        }
	}

	function remove(id) {
		$.ajax({
            url: "processRemoveTodo.jsp",
            type: "post",
            data: { id: id },
            success: (data) => window.location.reload(),
        });
	}
</script>
</head>

<body>
	<%
	TodoRepository repository = TodoRepository.getInstance();
	List<Todo> todos = repository.getTodos();
	%>
	<div class="todo-list-template">
		<div class="title">오늘 할 일</div>

		<section class="form-wrapper">
			<div class="form">
				<input name="text" id="text" onKeyPress="if (event.keyCode==13) addTodo()" />
				<div class="create-button" onclick="addTodo()">추가</div>
			</div>
		</section>

		<section class="todos-wrapper">
			<%
			for (Todo todo : todos) {
			%>
			<div class="todo-item" onclick="setDone(<%=todo.getId() %>);">
				<div class="remove" onclick="remove(<%=todo.getId() %>);">&times;</div>
				<div class="todo-text <%= todo.isDone()? "checked" : "" %>" ><%=todo.getTask() %></div>
				<%
				if(todo.isDone()) {
				%>
					<div class="check-mark">&#x2713;</div>
				<%
				}
				%>
			</div>
			<%
			}
			%>
		</section>
	</div>
</body>

</html>