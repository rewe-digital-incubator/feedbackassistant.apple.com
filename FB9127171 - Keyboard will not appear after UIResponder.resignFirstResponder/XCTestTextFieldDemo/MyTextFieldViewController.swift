import UIKit

class MyTextFieldViewController: UIViewController {}

extension MyTextFieldViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

