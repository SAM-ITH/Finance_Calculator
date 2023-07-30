//
//  SaveHelpViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-30.
//

import UIKit

class SaveHelpViewController: UIViewController {

    @IBOutlet weak var SaveHelpText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SaveHelpText.text = NSLocalizedString("SaveHelp", comment: "")
        self.SaveHelpText.font = UIFont(name: "SFMono-Semibold", size: 16)
       
    }
    


}
