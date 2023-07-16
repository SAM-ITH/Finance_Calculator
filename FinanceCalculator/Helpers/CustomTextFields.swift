//
//  CustomTextFields.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class CustomTextFields: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00).cgColor
    }

}
