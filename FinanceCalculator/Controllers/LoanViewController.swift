//
//  LoanViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class LoanViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var loanAmountTF: CustomTextFields!
    @IBOutlet weak var InterestTF: CustomTextFields!
    @IBOutlet weak var monthlyPaymentTF: CustomTextFields!
    @IBOutlet weak var totalNumberOfPaymentsTF: CustomTextFields!
    @IBOutlet weak var totalLoanAmountLBL: CustomLabels!
    
    
    var loanAmount: Double = 0.0
    var interestRate: Double = 0.0
    var monthlyPayment: Double = 0.0
    var totalNumberOfPayments: Double = 0.0
    var totalLoanAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalNumberOfPaymentsTF.delegate = self
    }
    

    @IBAction func calculateLoanBTN(_ sender: Any) {
        validateTextFields()
    }
     
    @IBAction func appliedSavedData(_ sender: Any) {
        applySavedValuesToTF()
    }
    
    // MARK: calculating the missing element
    func calculateMissingElementInLoans() {
        loanAmount = Double(loanAmountTF.text!) ?? 0.0
        interestRate = Double(InterestTF.text!) ?? 0.0
        monthlyPayment = Double(monthlyPaymentTF.text!) ?? 0.0
        totalNumberOfPayments = Double(totalNumberOfPaymentsTF.text!) ?? 0.0
        
        // Calculate missing element using compound interest formula
        if monthlyPayment == 0.0 {
            // Calculate amount if missing
            let monthlyInterestRate = (interestRate/100)/12
            let denominator = 1 - pow(1+monthlyInterestRate, -totalNumberOfPayments)
            let calculatedAmount = round(loanAmount*monthlyInterestRate/denominator)/100
            monthlyPaymentTF.textColor = UIColor(named: "AnswerColor")
            monthlyPaymentTF.text = String(calculatedAmount)
            let calculatedTotalAmount = round(calculatedAmount * totalNumberOfPayments)/100
            totalLoanAmountLBL.text = String(calculatedTotalAmount)
            
        } else if loanAmount == 0.0 {
            // Calculate loanAmount if missing
            let monthlyInterestRate = interestRate/1200
            let denominator = 1 - pow(1+monthlyInterestRate, -totalNumberOfPayments)
            let calculatedloanAmount = round(monthlyPayment * denominator/monthlyInterestRate)/100
            loanAmountTF.textColor = UIColor(named: "AnswerColor")
            loanAmountTF.text = String(calculatedloanAmount)
            
        } else if interestRate == 0.0 {
            // Calculate interest rate if missing
            let monthlyInterestRate = monthlyPayment/(loanAmount/12)
            let denominator = 1 - pow(1 + monthlyInterestRate, -totalNumberOfPayments )
            let calculatedInterestRate = round(100 * (1 - denominator)/monthlyInterestRate)/100
            InterestTF.textColor = UIColor(named: "AnswerColor")
            InterestTF.text = String(calculatedInterestRate)
            
        } else if totalNumberOfPayments == 0.0 {
            // Calculate years if missing
            let monthlyInterestRate = interestRate/(12*100)
            let numerator = log(monthlyPayment) - log(monthlyPayment - (loanAmount*monthlyInterestRate))
            let denominator = log(1 + monthlyInterestRate)
            let calculatedNumberOfPayments = ceil(numerator/denominator)
            totalNumberOfPaymentsTF.textColor = UIColor(named: "AnswerColor")
            totalNumberOfPaymentsTF.text = String(calculatedNumberOfPayments)
            
        }
        
    }
    
    // MARK: validating the text fields
    func validateTextFields() {
        var emptyFieldCount = 0

        // Check each text field
        if loanAmountTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if InterestTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if monthlyPaymentTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if totalNumberOfPaymentsTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }

        // Validate the count of empty fields
        if emptyFieldCount == 0 {
            // No fields are empty
            displayNoFieldsEmptyAlert()
        } else if emptyFieldCount == 1 {
            calculateMissingElementInLoans()
            saveValuesToUserDefaults()
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
    
    // MARK: user defaults
    func saveValuesToUserDefaults() {
        defaults.set(loanAmount, forKey: "loanAmount")
        defaults.set(interestRate, forKey: "interestRate")
        defaults.set(monthlyPayment, forKey: "monthlyPayment")
        defaults.set(totalNumberOfPayments, forKey: "totalNumberOfPayments")
    }
    
    func applySavedValuesToTF(){
        if let loanAmount = defaults.string(forKey: "loanAmount") {
                loanAmountTF.text = loanAmount
            }
        if let interestRate = defaults.string(forKey: "interestRate") {
                InterestTF.text = interestRate
            }
        if let monthlyPayment = defaults.string(forKey: "monthlyPayment") {
                monthlyPaymentTF.text = monthlyPayment
            }
        if let totalNumberOfPayments = defaults.string(forKey: "totalNumberOfPayments") {
                totalNumberOfPaymentsTF.text = totalNumberOfPayments
            }
    }
    
    // MARK: bump up the view when the keyboard distrub the textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == totalNumberOfPaymentsTF {
            moveViewUpForTextField(textField)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == totalNumberOfPaymentsTF {
            moveViewDown()
        }
    }

    func moveViewUpForTextField(_ textField: UITextField) {
  
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = -100.0
            }
    }

    func moveViewDown() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    
}
