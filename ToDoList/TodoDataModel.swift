//
//  TodoItem.swift
//  ToDoList
//
//  Created by Apiphoom Chuenchompoo on 28/7/2566 BE.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
