//
//  todoData.swift
//  proTodo
//
//  Created by 성다연 on 30/09/2019.
//  Copyright © 2019 성다연. All rights reserved.
//

import Foundation

let Database : TodoModel = TodoModel()

class TodoModel {
    var arrayList : [Todo] = [] // 일반 저장
    var repeatList : [Todo] = [] // 반복하는 할 일 저장
    
    let stock = Todo(memo: "앱 업데이트", color: "0x343434", update: Date(), number: 0)
    init() {
        arrayList.append(stock)
    }
}

class Todo {
    var memo : String
    var color : String
    var number : Int = 0
    var update : Date
    
    init(memo:String, color:String, update: Date, number: Int) {
        self.memo = memo
        self.color = color
        self.update = update
        self.number = number
    }
}

