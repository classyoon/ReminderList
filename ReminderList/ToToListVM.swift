//
//  ToToListVM.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import Foundation

struct Todo : Identifiable{
    var id = UUID()
    var item = ""
    var isDone = false
    
}

class TodoListVM : ObservableObject {
    @Published var todos = [Todo]()
    
    func toggleIsDone(todo: Todo) {
        guard let index = todos.firstIndex(where: {
            todo.id == $0.id
        }) else { return }
        
        todos[index].isDone.toggle()
    }
    
    func updateTodo(todo: Todo) {
        guard let index = todos.firstIndex(where: {
            todo.id == $0.id
        }) else { return }
        
        todos[index] = todo
    }
    
    func addTodo(todo: Todo){
        todos.append(todo)
    }
    func addTodo(){
        todos.append(Todo())
    }
    func addTodo(item: String, isDone: Bool) {
        let todo = Todo(item: item, isDone: isDone)
        todos.append(todo)
    }
    func removeTodo(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    func removeTodo(todo: Todo){
        guard let index = todos.firstIndex(where: {
            todo.id == $0.id
        }) else { return }
        
        todos.remove(at: index)
    }
    init(){
        todos.append(Todo(item: "Feed dogs", isDone: true))
        todos.append(Todo(item: "Code Todo", isDone: false))
        todos.append(Todo(item: "Pack Bags", isDone: false))
    }
}
