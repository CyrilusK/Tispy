import UIKit

class ResultsViewController: UIViewController {

    var total : String?
    var precent : Double?
    var numOfPeople: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        totalLabel.text = total
        settingsLabel.text = "Split between \(numOfPeople ?? 0) people, with \(precent ?? 0 * 100)% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
