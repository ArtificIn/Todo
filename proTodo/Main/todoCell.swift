//
//  todoCell.swift
//  proTodo
//
//  Created by 성다연 on 30/09/2019.
//  Copyright © 2019 성다연. All rights reserved.
//

import UIKit

class todoCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!

    let leftMarginForLabel : CGFloat = 15.0
    var listItems:Todo? {
        didSet{
            textField.text = listItems!.memo
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        textField.textColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.backgroundColor = UIColor.colorRGBHex(hex: 0x373535)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if listItems != nil {
            listItems?.memo = textField.text!
        }
        return true
    }
}

