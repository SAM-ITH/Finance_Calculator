//
//  LoanViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class LoanViewController: UIViewController {

    @IBOutlet weak var loandPresentValueTF: CustomTextFields!
    @IBOutlet weak var loanFutureValueTF: CustomTextFields!
    @IBOutlet weak var loanInterestTF: CustomTextFields!
    @IBOutlet weak var loanNoPaymentsTF: CustomTextFields!
    @IBOutlet weak var loanCompoundYearTF: CustomTextFields!
    @IBOutlet weak var loanPaymentTF: CustomTextFields!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func calculateLoanBTN(_ sender: Any) {
        print("you are in loans")
    }
}
