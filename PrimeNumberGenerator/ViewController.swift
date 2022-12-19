import UIKit
import BigNumber

class ViewController: UIViewController {

    @IBOutlet weak var tTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var qTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateButtonClicked(_ sender: Any) {
        guard let t = BInt(tTextField.text ?? "0") else { return }
        guard let q = BInt(qTextField.text ?? "0") else { return }
        
        let generator = Generator(t: t, q: q)
        generator.goto(.stepOne)
        
        updateAnswer(number: generator.answer)
    }
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func updateAnswer(number: BInt) {
        answerLabel.text = "Answer: \(number)"
        answerLabel.isHidden = false
    }
}

