

import UIKit




class CalculatorViewController: UIViewController {
    
    
    
    var tip = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTotal = "0.0"
    
    
    
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        switch sender.tag
        
        {
        case 0:
            zeroPctButton.isSelected = true
        case 1:
            tenPctButton.isSelected = true
        case 2:
            twentyPctButton.isSelected = true
        default:
            break
        }
    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
        
        
        
        
    }
    
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        
        
        
        switch true {
        case zeroPctButton.isSelected:
            tip = 0.0
            print(tip)
        case tenPctButton.isSelected:
            tip = 0.1
            print(tip)
        case twentyPctButton.isSelected:
            tip = 0.2
            print(tip)
        default:
            print("error")
        }
        
        let bill = billTextField.text!
        billTotal = Double(bill)!
        let result = billTotal * (1 + tip) / Double(numberOfPeople)
        let resultToDecimal = String(format: "%.2f", result)
        resultTotal = resultToDecimal
        
        print(resultTotal)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultsVC = resultTotal
            destinationVC.numberOfPeopleInResults = numberOfPeople
            let tipToInteger = Int(tip * 100)
            destinationVC.tipsForResults = tipToInteger
        }
    }
}



