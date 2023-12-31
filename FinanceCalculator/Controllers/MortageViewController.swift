//
//  MortageViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-07-15.
//

import UIKit

class MortageViewController: UIViewController, UITextFieldDelegate {

    let defaults = UserDefaults.standard
    @IBOutlet weak var MortageLoanAmountTF: CustomTextFields!
    @IBOutlet weak var mortageInterestTF: CustomTextFields!
    @IBOutlet weak var mortagePaymentTF: CustomTextFields!
    @IBOutlet weak var mortageNoOfYearsTF: CustomTextFields!
    
    var principal: Double = 0
    var interestRate: Double = 0
    var monthlyPayment: Double = 0
    var years: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mortageNoOfYearsTF.delegate = self

    }
    
    @IBAction func calculateMortage(_ sender: Any) {
        validateTextFields()
    }
    
    @IBAction func appliedPreviousValues(_ sender: Any) {
        applySavedValuesToTF()
    }
    
    // MARK: calculating the missing element
    func calculateMissingElementInMortage() {
        principal = Double(MortageLoanAmountTF.text!) ?? 0.0
        interestRate = Double(mortageInterestTF.text!) ?? 0.0
        monthlyPayment = Double(mortagePaymentTF.text!) ?? 0.0
        years = Double(mortageNoOfYearsTF.text!) ?? 0.0
        
        // Calculate missing element using compound interest formula
        if monthlyPayment == 0.0 {
            // Calculate amount if missing
            let monthlyInterestRate = (interestRate/100)/12
            let denominator = 1 - pow(1+monthlyInterestRate, -years*12)
            let calculatedAmount = round(principal*monthlyInterestRate/denominator)/100
            mortagePaymentTF.textColor = UIColor(named: "AnswerColor")
            mortagePaymentTF.text = String(calculatedAmount)
            
        } else if principal == 0.0 {
            // Calculate principal if missing
            let monthlyInterestRate = interestRate/1200
            let denominator = 1 - pow(1+monthlyInterestRate, -12*years)
            let calculatedPrincipal = round(monthlyPayment * denominator/monthlyInterestRate)/100
            MortageLoanAmountTF.textColor = UIColor(named: "AnswerColor")
            MortageLoanAmountTF.text = String(calculatedPrincipal)
            
        } else if interestRate == 0.0 {
            // Calculate interest rate if missing
            let monthlyInterestRate = monthlyPayment/(principal/12)
            let denominator = 1 - pow(1 + monthlyInterestRate, -years*12 )
            let calculatedInterestRate = round(100 * (1 - denominator)/monthlyInterestRate)/100
            mortageInterestTF.textColor = UIColor(named: "AnswerColor")
            mortageInterestTF.text = String(calculatedInterestRate)
            
        } else if years == 0.0 {
            // Calculate years if missing
            let monthlyInterestRate = interestRate/1200
            let numerator = log(monthlyPayment) - log(monthlyPayment - (principal*monthlyInterestRate))
            let denominator = log(1 + monthlyInterestRate)
            let calculatedYears = ceil((numerator/denominator)/12)
            mortageNoOfYearsTF.textColor = UIColor(named: "AnswerColor")
            mortageNoOfYearsTF.text = String(calculatedYears)
            
        }
        
    }
    
    // MARK: validating the text fields
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
            calculateMissingElementInMortage()
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
        defaults.set(principal, forKey: "principal")
        defaults.set(interestRate, forKey: "mortageinterestRate")
        defaults.set(monthlyPayment, forKey: "mortagemonthlyPayment")
        defaults.set(years, forKey: "mortageyears")
    }
    
    func applySavedValuesToTF(){
        if let principal = defaults.string(forKey: "principal") {
                MortageLoanAmountTF.text = principal
            }
        if let interestRate = defaults.string(forKey: "mortageinterestRate") {
                mortageInterestTF.text = interestRate
            }
        if let monthlyPayment = defaults.string(forKey: "mortagemonthlyPayment") {
            mortagePaymentTF.text = monthlyPayment
            }
        if let years = defaults.string(forKey: "mortageyears") {
                mortageNoOfYearsTF.text = years
            }
    }
    
    // MARK: bump up the view when the keyboard distrub the textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == mortageNoOfYearsTF {
            moveViewUpForTextField(textField)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == mortageNoOfYearsTF {
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

