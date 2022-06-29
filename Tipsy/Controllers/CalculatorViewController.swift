import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var values = Data()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        guard let title = sender.currentTitle else { return }
        values.precent = Double(title.dropLast())! / 100.0
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        values.numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = Double(billTextField.text!.replacingOccurrences(of: ",", with: ".")) else {
            return billTextField.text = ""
        }
        values.billTotal = bill
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResult" else { return }
        guard let destination = segue.destination as? ResultsViewController else { return }
        destination.numOfPeople = values.numberOfPeople
        destination.precent = values.precent
        destination.total = values.calculate()
    }
}

