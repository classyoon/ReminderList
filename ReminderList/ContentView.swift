//
//  ContentView.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var instanceOfReminders = Reminders()
    @State var InputedName = "Test"
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(instanceOfReminders.items, id: \.name) { Reminder in
                        Text(Reminder.name)
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("Reminders")
                .toolbar{
                    Button{
                        let localReminder = Reminder(name: InputedName, isComplete: false)
                        instanceOfReminders.items.append(localReminder)
                    }
                label: {
                    Image(systemName: "plus")
                }
                }
                TextField("Input word", text: $InputedName).onSubmit(addNewWord)
            }
        }
        
    }
    func removeItems(at offsets: IndexSet){
        instanceOfReminders.items.remove(atOffsets: offsets)
    }
    func addNewWord(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
