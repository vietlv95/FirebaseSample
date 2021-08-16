//
//  SignUpViewController.swift
//  FirebaseSample
//
//  Created by Viet Le on 15/08/2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        
    }

    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        if isValidInformantion() {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                if let user = authResult?.user {
                    let vc = MainTabbarViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    self.addNewUserToCollection(user: user)
                }
            }
        }
    }
    
    func addNewUserToCollection(user: User) {
        let collection = Firestore.firestore().collection("User")
        let userRef = collection.document(user.uid)
        userRef.setData(["DisplayName": user.uid])
        
    }
    
    private func isValidInformantion() -> Bool {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "Please type email & password"
            return false
        }
        // TODO valid email , password = confirm password ...ect...
        return true
    }

}
