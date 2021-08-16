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
        try? Auth.auth().signOut()
        if let scenseDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            scenseDelegate.setRootViewController()
        }
    }
    
    @IBAction func updateNameButtonDidTap(_ sender: Any) {
        ProgressHUD.show()
        if let displayName = nameTextField.text, let user = Auth.auth().currentUser {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = displayName
            
            changeRequest.commitChanges { error in
                let collection = Firestore.firestore().collection("User")
                let userRef = collection.document(user.uid)
                userRef.setData(["DisplayName": displayName])
                ProgressHUD.dismiss()
            }
        }
    }

}
