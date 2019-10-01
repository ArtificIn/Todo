//
//  TodoVC.swift
//  proTodo
//
//  Created by 성다연 on 30/09/2019.
//  Copyright © 2019 성다연. All rights reserved.
//

import UIKit

class TodoVC: UIViewController {
    @IBOutlet weak var todoList:UITableView!
    @IBOutlet weak var plusBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSegmentedControl()
        todoList.delegate = self
        todoList.dataSource = self
    }
    
    private func createSegmentedControl(){
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 50),
            buttonTitle:["할 일 목록", "달력", "명언함"])
        codeSegmented.backgroundColor = UIColor.colorRGBHex(hex: 0x373535)
        view.addSubview(codeSegmented)
    }
}

extension TodoVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = Database.arrayList[indexPath.row]
        let cell: todoCell = tableView.dequeueReusableCell(withIdentifier: "todocell") as! todoCell
        
        cell.labelMemo.text = todo.memo
        cell.labelColor.backgroundColor = UIColor.colorRGBHex(hex: Int(todo.color) ?? 0xFFFFFF)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // tableview header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section:Int)-> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x:0, y:0, width: tableView.frame.width, height:50))
        
        let label = UILabel()
        label.frame = CGRect.init(x:20, y:10, width: headerView.frame.width-10, height: headerView.frame.height - 10)
        label.text = "9월 30일 할일 목록"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 24)
        
        let label2 = UILabel()
        label2.frame = CGRect.init(x: tableView.frame.width - 50, y: 20, width: 41, height: 17)
        label2.text = "반복"
        label2.textColor = UIColor.white
        label2.font = UIFont.systemFont(ofSize: 16)
        
        headerView.addSubview(label)
        headerView.addSubview(label2)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section:Int) -> CGFloat { return 50 }
}
