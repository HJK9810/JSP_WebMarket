package dao;

import java.util.ArrayList;
import java.util.List;

import dto.Todo;

public class TodoRepository {
	public static long currentId = 0; // 현재 id
	
	private List<Todo> todos = new ArrayList<>();
	
	private static TodoRepository instance = new TodoRepository();
	
	public static TodoRepository getInstance() {
		return instance;
	}
	
	public List<Todo> getTodos() {
		return todos;
	}
	
	// todo add 함수
	public void addTodo(Todo todo) {
		todo.setId(currentId);
		currentId++;
		todos.add(todo);
	}
}
