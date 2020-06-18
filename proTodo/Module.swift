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
}

struct LabelList : Codability {
    var arrayList : [Label]
}


struct Todo : Codability {
    var title : String
    var label : [Label]
    var date : String
}

struct TodoList : Codability {
    var arrayList : [Todo]
}


struct Project : Codability {
    var name : String
    var date : String
    var notice : Bool
    var todo : [Todo]
}

struct ProjectList : Codability {
    var arrayList : [Project]
}
