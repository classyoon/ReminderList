//
//  UpdateTodoView.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import SwiftUI

struct UpdateTodoView: View {
    @ObservedObject var vm : TodoListVM
    @State var todo : Todo
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            TextField("todo", text: $todo.item)
            Toggle("Is Done", isOn: $todo.isDone)
            
            Button {
                vm.updateTodo(todo: todo)
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("Update Todo")
            }

        }
    }
}
struct UpdateTodoView_Previews: PreviewProvider {
    
    static var previews: some View {
        let vm = TodoListVM()
        UpdateTodoView(vm: vm, todo: vm.todos[0])
    }
}
