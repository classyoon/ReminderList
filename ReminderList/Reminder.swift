//
//  Reminder.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import Foundation

struct Reminder : Identifiable {
    let name : String
    let isComplete : Bool
    var id = UUID()

}
