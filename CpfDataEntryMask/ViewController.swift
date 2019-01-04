//
//  ViewController.swift
//  CpfDataEntryMask
//
//  Created by Marcelo Sampaio on 04/01/19.
//  Copyright © 2019 EIG Mercados. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var cpf: UITextField!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cpf.delegate = self
    }
    
    // MARK: - UI Actions
    @IBAction func goAction(_ sender: Any) {
        if (cpf.text?.isValidCpf())! {
            print("CPF OK")
        }else{
            print("CPF NOT OK")
        }
    }
    
    // MARK: - Text Field Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("👉 range index: \(range.location)  👉 range direction: \(range.length)  👉 replacement string: \(string)  👉 textField: \(textField.text!)")
        
        var updatedText = textField.text!
        if (range.location == 3 || range.location == 7 || range.location == 11) && range.length == 0 {
            if range.location < 11 {
                updatedText.append(".")
            }else{
                updatedText.append("-")
            }
            
        }
        print("💢👉 updatedText: \(updatedText)")
        updateTextField(updatedText)
        
        if range.location < 14 {
            return true
        }else{
            return false
        }
        
    }
    
    private func updateTextField(_ input: String) {
        cpf.text = input
    }
    
}


