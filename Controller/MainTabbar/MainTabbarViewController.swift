//
//  MainTabbarViewController.swift
//  FirebaseSample
//
//  Created by Viet Le on 15/08/2021.
//

import UIKit

class MainTabbarViewController: UIViewController {
    
    let profileVC = ProfileViewController()
    lazy var todoListVC: UIViewController = {
        let storyboard = UIStoryboard.init(name: "Todo", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TodoListNav")
        return vc
    }()

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        activeProfile()
    }

    @IBAction func profileButtonDidTap(_ sender: Any) {
        activeProfile()
    }
    
    @IBAction func chatButtonDidTap(_ sender: Any) {
        activeTodoList()
    }
    
    private func activeProfile() {
        removeTodoList()
        addChild(profileVC)
        contentView.addSubview(profileVC.view)
        profileVC.view.fitSuperviewConstraint()
    }
    
    private func removeTodoList() {
        todoListVC.removeFromParent()
        todoListVC.view.removeFromSuperview()
    }
    
    private func activeTodoList() {
        removeProfile()
        addChild(todoListVC)
        contentView.addSubview(todoListVC.view)
        todoListVC.view.fitSuperviewConstraint()
    }
    
    private func removeProfile() {
        profileVC.removeFromParent()
        profileVC.view.removeFromSuperview()
    }
}


extension UIView {
    func fitSuperviewConstraint(edgeInset: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let superview = self.superview!
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInset.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInset.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edgeInset.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edgeInset.bottom).isActive = true
    }
}
