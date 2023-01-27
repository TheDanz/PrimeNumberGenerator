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
        guard let t = BInt(tTextField.text ?? "0") else {
            presentAlert()
            return
        }
        
        guard let q = BInt(qTextField.text ?? "0") else {
            presentAlert()
            return
        }
        
        let generator = Generator(t: t, q: q)
        generator.goto(.stepOne)
        
        primeNumberTextView.text = "\(generator.answer)"
    }
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "ERROR", message: "Enter correct data", preferredStyle: .alert)
        let OKAlertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(OKAlertAction)
        present(alert, animated: true)
    }
}

