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
    
    let loanAmount: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func calculateMortage(_ sender: Any) {
        validateTextFields()
    }
    
    func validateTextFields() {
        var emptyFieldCount = 0

        // Check each text field
        if MortageLoanAmountTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if mortageInterestTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if mortagePaymentTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if mortageNoOfYearsTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }

        // Validate the count of empty fields
        if emptyFieldCount == 0 {
            // No fields are empty
            displayNoFieldsEmptyAlert()
        } else if emptyFieldCount == 1 {
            // Only one field is empty
            print("wait we will count this")
        } else {
            // More than one field is empty
            displayFieldsEmptyAlert()
        }
    }
    
    func displayNoFieldsEmptyAlert()
    {
         let alert = UIAlertController(title: "Alert", message: "Please leave one of the values blank to perform the calculation", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default))
         self.present(alert, animated: true, completion: nil)
    }
    
    func displayFieldsEmptyAlert()
    {
         let alert = UIAlertController(title: "Alert", message: "Two or more fileds are empty, Please leave blank only the value you want to count", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default))
         self.present(alert, animated: true, completion: nil)
    }
    
    
}

