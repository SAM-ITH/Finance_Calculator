//
//  LoanHelpViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-30.
//

import UIKit

class LoanHelpViewController: UIViewController {

    @IBOutlet weak var LoanHelpText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoanHelpText.text = NSLocalizedString("LoanHelp", comment: "")
        self.LoanHelpText.font = UIFont(name: "SFMono-Semibold", size: 16)
    }
    

}
