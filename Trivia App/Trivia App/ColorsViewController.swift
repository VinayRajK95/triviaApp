//
//  ColorsViewController.swift
//  Trivia App
//
//  Created by Vinay Raj K on 24/01/20.
//  Copyright © 2020 Vinay Raj K. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var colorsTF: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsTF.delegate = self
        submitButton.isEnabled = false
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        submitButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        let colors = colorsTF.text!
        appdelegate.user.colors = colors
        let user = appdelegate.user
        appdelegate.arrayUsers.append(user)
        presentAlert()
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        submitButton.isEnabled = !sender.text!.isEmpty
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Success", message: "User data has been saved", preferredStyle: .alert)
        let done = UIAlertAction(title: "ok", style: .default) { [weak self] _ in
            NotificationCenter.default.post(name: Notification.Name(rawValue: "reset"), object: nil)
            self?.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
    }
}

extension ColorsViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let charactersAllowed = CharacterSet.letters
        let comma = ","
        let characterSet = CharacterSet(charactersIn: string)
        return charactersAllowed.isSuperset(of: characterSet) || string.contains(comma)
    }
    
}
