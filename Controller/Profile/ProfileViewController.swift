//
//  ProfileViewController.swift
//  FirebaseSample
//
//  Created by Viet Le on 15/08/2021.
//

import UIKit
import Firebase
import ProgressHUD

class ProfileViewController: UIViewController {

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
            userIDLabel.text = "UserID: " + user.uid
            nameTextField.text = user.displayName
        }
    }

    @IBAction func logoutButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func updateNameButtonDidTap(_ sender: Any) {
        
    }

}
