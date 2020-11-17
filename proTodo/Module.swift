//
//  CalendarData.swift
//  proTodo
//
//  Created by 성다연 on 2020/06/11.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

let ProTodoName = "ProTodo"
let TodoListFileName = "TodoList.file"
let ProjectListFileName = "ProjectList.file"
let LabelListFileName = "LabelList.file"

let TodoArrayList = TodoList()
let LabelArrayList = LabelList()
let ProjectArrayList = ProjectList()

protocol Codability : Codable {}

extension Codability {
    typealias T = Self
    
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static func decode(data : Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

struct Label : Codability {
    var name : String
    var color : Int
    
    init(name : String, color : Int) {
        self.name = name
        self.color = color
    }
}

class LabelList : Codability {
    var arrayList : [Label]
    
    init() {
        self.arrayList = []
    }
}


struct Todo : Codability {
    var title : String
    var date : String
    var label : [Label]
    var color : Int
    
    init(title : String, date : String, label : [Label], color : Int) {
        self.title = title
        self.date = date
        self.label = label
        self.color = color
    }
}

class TodoList : Codability {
    var arrayList : [Todo]
    
    init() {
        self.arrayList = []
    }
}


struct Project : Codability {
    var name : String
    var date : String
    var notice : Bool
    var todo : [Todo]
    
    init(name : String, date : String, notice : Bool, todo : [Todo]) {
        self.name = name
        self.date = date
        self.notice = notice
        self.todo = todo
    }
}

class ProjectList : Codability {
    var arrayList : [Project]
    
    init(){
        self.arrayList = []
    }
}
