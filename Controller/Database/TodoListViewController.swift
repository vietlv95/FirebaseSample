//
//  TodoListViewController.swift
//  FirebaseSample
//
//  Created by Viet Le on 16/08/2021.
//

import UIKit
import Firebase

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var todos: [Todo]?
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      fetchData()
    }
    
    private func config() {
      title = "People"
      tableView.delegate = self
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func fetchData() {
        
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
      showAlert(title: "New Todo", message: "Enter new todo") {[weak self] todo in
        self?.save(todoString: todo)
      }
    }
    
    func update(todoString: String,  index: Int) {
        let todo = self.todos![index]
        
        
    }
    
    func save(todoString: String) {
        let newTodo = Todo()
        newTodo.id = UUID().uuidString
        newTodo.todo = todoString
        
    }
}

// MARK: - UITableViewDataSource
extension TodoListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let todo = todos![indexPath.item]
    cell.textLabel?.text = todo.todo
    return cell
  }
}


extension TodoListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    showAlert(title: "Update", message: "Enter new info") {[weak self] todo in
        self?.update(todoString: todo, index: indexPath.item)
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        let todo = self.todos![indexPath.item]
        
    }
  }
  
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
}

extension TodoListViewController {
  func showAlert(title: String, message: String, saveCompletionHandler:((_ todo: String) -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let saveAction = UIAlertAction(title: "Save", style: .default) { action in

      guard let textField = alert.textFields?.first,
        let todo = textField.text else {
          return
      }
      saveCompletionHandler?(todo)
    }

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addTextField { nameTextField in
      nameTextField.placeholder = "todo"
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)

    present(alert, animated: true)
  }
}
