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
            view.alert(msg: "👍 CPF OK !", sender: self)
        }else{
            view.alert(msg: "❌ CPF não válido!", sender: self)
        }
    }
    
    // MARK: - Text Field Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var updatedText = textField.text!
        if (range.location == 3 || range.location == 7 || range.location == 11) && range.length == 0 {
            if range.location < 11 {
                updatedText.append(".")
            }else{
                updatedText.append("-")
            }
            
        }
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


