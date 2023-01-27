import UIKit
import BigNumber

class ViewController: UIViewController {

    @IBOutlet weak var tTextField: UITextField!
    @IBOutlet weak var qTextField: UITextField!
    @IBOutlet weak var primeNumberTextView: UITextView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateButtonClicked(_ sender: Any) {
        guard let t = BInt(tTextField.text ?? "0") else { return }
        guard let q = BInt(qTextField.text ?? "0") else { return }
        
        let generator = Generator(t: t, q: q)
        generator.goto(.stepOne)
        
        primeNumberTextView.text = "\(generator.answer)"
    }
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
}

