//
//  CustomButton.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-19.
//

import UIKit

class CustomButton: UIButton
{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.font = UIFont(name: "SFMono-Semibold", size: 16)
        self.titleLabel?.textColor = UIColor(named: "AccentColor")
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.cornerCurve = .continuous
        
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor(named: "AccentColor")!.cgColor
        
        self.layer.backgroundColor = UIColor(named: "PrimaryBackground")!.cgColor
    }
    
}

