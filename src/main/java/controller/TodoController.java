package controller;

import java.io.IOException;

import dao.TodoRepository;
import dto.Todo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// tomcat에 controller 존재 노출
@WebServlet(name = "TodoController", urlPatterns = {"/addTodo.do", "/toggleTodo.do", "/removeTodo.do"})
public class TodoController extends HttpServlet{
	private static final long serialVersionUID = -5789298759459019056L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 주소(ex -  processAddTodo)
		String command = req.getRequestURI().substring(req.getContextPath().length());
		TodoRepository repository = TodoRepository.getInstance();
		
		if(command.equals("/addTodo.do")) {
			String task = req.getParameter("task");
			Todo todo = new Todo(task);
			repository.addTodo(todo);
		} else if(command.equals("/toggleTodo.do")) {
			long id = Long.parseLong(req.getParameter("id"));
			repository.toggle(id);
		} else if(command.equals("/removeTodo.do")) {
			long id = Long.parseLong(req.getParameter("id"));
			repository.remove(id);
		}
//		req.setAttribute(command, repository.getTodos());
		// 리다이렉트 but 주소창에 노출X
		req.getRequestDispatcher("todolist.jsp").forward(req, resp);
	}
}
