//
//  ViewController.swift
//  Trivia App
//
//  Created by Vinay Raj K on 24/01/20.
//  Copyright © 2020 Vinay Raj K. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(reset), name: Notification.Name("reset"), object: nil)
        Name.delegate = self
        nextButton.isEnabled = false
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        nextButton.layer.cornerRadius = 10
    }

    @IBAction func Next(_ sender: UIButton) {
        guard let name = Name.text else { return  }
        appdelegate.user.name = name
        let story =  UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "CricketerVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        nextButton.isEnabled = !sender.text!.isEmpty
    }
    
    @IBAction func history(_ sender: UIButton) {
        performSegue(withIdentifier: "CricketerVC", sender: self)
    }
    
    @objc func reset() {
        Name.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let charactersAllowed = CharacterSet.letters
        let charactersAllowedSpaces = CharacterSet.whitespaces
        let characterSet = CharacterSet(charactersIn: string)
        return charactersAllowed.isSuperset(of: characterSet) || charactersAllowedSpaces.isSuperset(of: characterSet)
    }

}
