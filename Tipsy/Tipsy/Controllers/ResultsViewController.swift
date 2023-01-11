
import UIKit

class ResultsViewController: UIViewController {
    
    var resultsVC: String?
    var numberOfPeopleInResults: Int?
    var tipsForResults: Int?
    
    var calcView = CalculatorViewController()
    
    
    @IBOutlet weak var totalLAbel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLAbel.text = resultsVC!
        settingsLabel.text = "Split between \(numberOfPeopleInResults!) people with \(tipsForResults!)% tip."
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
