//
//  CalendarVC.swift
//  proTodo
//
//  Created by 성다연 on 2020/06/11.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    // TopView
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var segmentLineView: UIView!
    
    // Calendar
    @IBOutlet weak var dateLabel: UILabel!
    
    // TodoList
    @IBOutlet weak var todoTableView: UITableView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.todoTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegatSetting()
    }
}



extension CalendarVC {
    private func delegatSetting(){
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
}


extension CalendarVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoArrayList.arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = TodoArrayList.arrayList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell") as! todoCell
                   
        cell.textField?.text = todo.title
        cell.colorView.backgroundColor = UIColor.colorRGBHex(hex: todo.color)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
                   
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
