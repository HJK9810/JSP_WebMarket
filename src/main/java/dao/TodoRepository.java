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
	
	public void toggle(long id) {
		for(Todo todo : todos) {
			if(todo.getId() == id) {
				todo.setDone(!todo.isDone());
				break;
			}
		}
	}
	
	public void remove(long id) {
		for(int idx = 0; idx < todos.size(); idx++) {
			if(todos.get(idx).getId() == id) {
				todos.remove(idx);
				break;
			}
		}
		
		// remove(object)
//		for(Todo todo : todos) {
//			if(todo.getId() == id) {
//				todos.remove(todo);
//				break;
//			}
//		}
	}
}
