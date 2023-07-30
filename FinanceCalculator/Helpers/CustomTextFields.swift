//
//  CustomTextFields.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class CustomTextFields: UITextField, UITextFieldDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.keyboardType = .decimalPad
        
        self.layer.backgroundColor = UIColor(named: "PrimaryBackground")!.cgColor
        self.layer.cornerRadius = 10
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(named: "AccentColor")!.cgColor
        
        self.addDoneButtonOnKeyboard()
    }
    
    // add done button to keyboard
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            self.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            self.resignFirstResponder()
        }

}
