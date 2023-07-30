//
//  MortageHelpViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-30.
//

import UIKit

class MortageHelpViewController: UIViewController {

    @IBOutlet weak var MortageDisc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MortageDisc.text = NSLocalizedString("MortageHelp", comment: "")
        self.MortageDisc.font = UIFont(name: "SFMono-Semibold", size: 16)
    }

}
