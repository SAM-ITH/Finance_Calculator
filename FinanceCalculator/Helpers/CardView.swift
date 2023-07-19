//
//  CardView.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-18.
//

import UIKit

class cardViewModifiers : UIVisualEffectView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 30
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 20
        
    }
    
}




