//
//  Reminders.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import Foundation

class Reminders: ObservableObject {
    @Published var items = [Reminder]()
}
