//
//  LoginViewController.swift
//  FirebaseSample
//
//  Created by Viet Le on 15/08/2021.
//

import UIKit
import Firebase
import GoogleSignIn
import ProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signinButtonDidTap(_ sender: Any) {
        ProgressHUD.show()
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { authDataResult, error in
            ProgressHUD.dismiss()
            if authDataResult != nil {
                let vc = MainTabbarViewController.init()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func googleSignInButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
