//
//  TodoListView.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var vm = TodoListVM()
    var body: some View {
        NavigationView{
            Form{
                ForEach (vm.todos){ todo in
                    NavigationLink {
                        UpdateTodoView(vm: vm, todo: todo)
                    } label: {
                        HStack{
                            Text("\(todo.item)")
                        }
                    }
                }
                .onDelete(perform: vm.removeTodo)
            }
            .navigationTitle("Conner's SuperList")
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    Button {
                        
                    } label: {
                        Text("Add")
                    }
                }
                ToolbarItem{
                    EditButton()
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
