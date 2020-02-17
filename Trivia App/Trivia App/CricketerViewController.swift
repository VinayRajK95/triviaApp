//
//  CricketerViewController.swift
//  Trivia App
//
//  Created by Vinay Raj K on 24/01/20.
//  Copyright © 2020 Vinay Raj K. All rights reserved.
//

import UIKit

class CricketerViewController: UIViewController {

    var pickerView : UIPickerView?
    
    var favCricketer = String()
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var cricketerTF: UITextField!
    
    var players = ["Virat Kohli","M S Dhoni", "Steve Smith", "Eoin Morgan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPickerView()
        cricketerTF.delegate = self
        nextButton.isEnabled = false
        favCricketer = players[0]
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        nextButton.layer.cornerRadius = 10
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let cricketer = cricketerTF.text else { return  }
        appdelegate.user.favCricketer = cricketer
        performSegue(withIdentifier: "ColorsVC", sender: self)
    }
    
    
    func setupPickerView(){
        pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.cricketerTF.inputView = pickerView
        self.cricketerTF.inputAccessoryView = toolBar
    }
    
    @objc func donePicker(){
        if (self.cricketerTF.text?.isEmpty)!{
            pickerView(pickerView!, didSelectRow: 0, inComponent: 0)
        }
        self.cricketerTF.resignFirstResponder()
    }

    
    @IBAction func editingChanged(_ sender: UITextField) {
        nextButton.isEnabled = !sender.text!.isEmpty
    }
}

extension CricketerViewController:  UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return players.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return players[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        favCricketer = players[row]
        cricketerTF.text = favCricketer
    }
}

extension CricketerViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return false
    }
}
