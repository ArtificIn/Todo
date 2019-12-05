//
//  CreateVC.swift
//  proTodo
//
//  Created by 성다연 on 03/12/2019.
//  Copyright © 2019 성다연. All rights reserved.
//

import UIKit


class CreateVC: UIViewController {
    @IBOutlet weak var ColorCollectionView: UICollectionView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var todoView: UIView!
    @IBOutlet weak var completeBtn: UIButton!
    
    var selectColor = 0xffffff
    var colorTouch = false
    let items = [
        0xfff8b6, 0xffe4a3, 0xffbd91, 0xff8d71, 0xff707e,
        0xffc100, 0xff9a00, 0xff7400, 0xff4d00, 0xff0000,
        0xcef19d, 0xa6dba7, 0x77bd98, 0x398684, 0x094869,
        0xdaf8e3, 0x97ebdb, 0x00c2c7, 0x0086ad, 0x005582,
        0xfadbe0, 0xeaadbd, 0xb88a9f, 0x876880, 0x554562]
    
    override func viewWillAppear(_ animated: Bool) {
        func keyboardSetting(){
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.hideKeyboardTapped()
        self.clickSetting()
    }
}

// 버튼 터치
extension CreateVC {
    func clickSetting(){
        dateViewClicked()
        completeButton()
    }
    
    // 날자 선택 창
    func dateViewClicked(){
        
    }
    
    func completeButton(){
        completeBtn.addTarget(self, action: #selector(completeAction), for: .touchUpInside)
    }
    @objc func completeAction(){
        dismiss(animated: true)
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
                 if let KeyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                     if self.view.frame.origin.y == 0 {
                         self.view.frame.origin.y -= KeyboardSize.height
                         self.todoView.frame.origin.y -= KeyboardSize.height
                         self.completeBtn.frame.origin.y -= KeyboardSize.height
                     }
                 }
             }
             
             @objc func keyboardWillDisappear(notification: NSNotification){
                 if let KeyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                     if self.view.frame.origin.y != 0 {
                         self.view.frame.origin.y += KeyboardSize.height
                         self.todoView.frame.origin.y += KeyboardSize.height
                         self.completeBtn.frame.origin.y += KeyboardSize.height
                     }
                 }
             }
}

// 데이터 처리
extension CreateVC {
    
}

// 콜렉션 뷰
extension CreateVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = ColorCollectionView.cellForItem(at: indexPath)
        selectColor = items[indexPath.item]
        // int -> hex
        // var st = NSString(format: "%02X", selectColor)
        cell?.backgroundColor = UIColor.darkGray
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = ColorCollectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.colorRGBHex(hex: 0x373535)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ColorCollectionView.dequeueReusableCell(withReuseIdentifier: "colorcollectcell", for: indexPath) as! ColorCollectCell
        
        cell.layer.cornerRadius = 17
        cell.colorImg.backgroundColor = UIColor.colorRGBHex(hex: items[indexPath.item])
        return cell
    }
}
