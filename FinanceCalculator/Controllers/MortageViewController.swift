//
//  MortageViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class MortageViewController: UIViewController {

    @IBOutlet weak var MortageLoanAmountTF: CustomTextFields!
    @IBOutlet weak var mortageInterestTF: CustomTextFields!
    @IBOutlet weak var mortagePaymentTF: CustomTextFields!
    @IBOutlet weak var mortageNoOfYearsTF: CustomTextFields!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func calculateMortage(_ sender: Any) {
        print("hello world")
    }
    
}
