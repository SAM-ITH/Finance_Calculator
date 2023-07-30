//
//  ViewController.swift
//  FinanceCalculator
//
//  Created by Samith on 2023-06-28.
//

import UIKit

class SavingsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var presentValueTF: CustomTextFields!
    @IBOutlet weak var futureValueTF: CustomTextFields!
    @IBOutlet weak var interestRateTF: CustomTextFields!
    @IBOutlet weak var noOfPaymentsPerYearTF: CustomTextFields!
    @IBOutlet weak var compundsPerYearTF: CustomTextFields!
    @IBOutlet weak var amountOfRegularContributionTF: CustomTextFields!
    
    @IBOutlet weak var regularContributionSwitch: UISwitch!
    
    
    var presentValue: Double = 0.0
    var futureValue: Double = 0.0
    var interest: Double = 0.0
    var noOfPaymentsPerYear: Double = 0.0
    var amountOfRegularContribution: Double = 0.0
    var compoundsPerYear: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateSavings(_ sender: Any) {
        validateTextFields()
        calculateMissingElementInMortage()
    }
    
    // MARK: calculating the missing element
    func calculateMissingElementInMortage() {
        presentValue = Double(presentValueTF.text!) ?? 0.0
        futureValue = Double(futureValueTF.text!) ?? 0.0
        interest = Double(interestRateTF.text!) ?? 0.0
        amountOfRegularContribution = Double(amountOfRegularContributionTF.text!) ?? 0.0
        compoundsPerYear = Double(compundsPerYearTF.text!) ?? 0.0
        noOfPaymentsPerYear = Double(noOfPaymentsPerYearTF.text!) ?? 0.0
        
        // Calculate missing element using compound interest formula
        if presentValue == 0.0 {
            // Calculate present is missing
            let x = compoundsPerYear * noOfPaymentsPerYear
            let y = 1 + ((interest/100)/compoundsPerYear)
            let calculatedPresent = futureValue / pow(y,x)
            presentValueTF.textColor = UIColor(named: "AnswerColor")
            presentValueTF.text = String(calculatedPresent)
            
            
        } else if futureValue == 0.0 {
            // Calculate principal if missing
            let x = noOfPaymentsPerYear * noOfPaymentsPerYear
            let y =  1 + (interest/compoundsPerYear)
            let calcFutureValue = pow(y,x) * presentValue
            futureValueTF.text = String(calcFutureValue)
            
            if(regularContributionSwitch.isOn && amountOfRegularContribution > 0.0){
                let interestRate = interest/100
                let compoundedValue = presentValue * pow(1 + interestRate, compoundsPerYear)
                let calcFutureValueWithContribution = compoundsPerYear + amountOfRegularContribution * ((pow(1 + interestRate, compoundsPerYear) - 1) / interestRate)
                futureValueTF.text = String(calcFutureValueWithContribution)
            } else if (regularContributionSwitch.isOn && amountOfRegularContribution == 0.0){
                displayContributionFieldsEmptyAlert()
            }
            
            
        } else if interest == 0.0 {
            // Calculate interest rate if missing
            let x =  1 / (compoundsPerYear * noOfPaymentsPerYear)
            let y =  futureValue / presentValue
            let calculatedInterest = (pow(y,x) - 1) * compoundsPerYear * 100
            interestRateTF.textColor = UIColor(named: "AnswerColor")
            interestRateTF.text = String(calculatedInterest)
            
            
        } else if noOfPaymentsPerYear == 0.0 {
            // Calculate number of payments per year is missing
            let x =  log(futureValue / presentValue)
            let y =   log(1 + ((interest/100)/compoundsPerYear)) * compoundsPerYear
            let calculatedNoOfPayments = x/y
            noOfPaymentsPerYearTF.textColor = UIColor(named: "AnswerColor")
            noOfPaymentsPerYearTF.text = String(calculatedNoOfPayments)
            
        } else if compoundsPerYear == 0.0 {
            // calculate number of compounds per year
            let x = log(futureValue/presentValue)
            let y = log(1+(interest/100))
            let calculatedCompoundsPerYear = x/y
            compundsPerYearTF.textColor = UIColor(named: "AnswerColor")
            compundsPerYearTF.text = String(calculatedCompoundsPerYear)
        }
        
    }
    
    
    
    // MARK: validating the textfields
    func validateTextFields() {
        var emptyFieldCount = 0

        // Check each text field
        if presentValueTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if futureValueTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if interestRateTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if noOfPaymentsPerYearTF.text?.isEmpty ?? true {
            emptyFieldCount += 1
        }
        if compundsPerYearTF.text?.isEmpty ?? true {
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
    
    func displayContributionFieldsEmptyAlert()
    {
         let alert = UIAlertController(title: "Alert", message: "Please enter a value to contribution to calculate the value", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default))
         self.present(alert, animated: true, completion: nil)
    }
    
}

