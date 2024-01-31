//
//  ViewController.swift
//  Todoey-Section-19
//
//  Created by Abdurahman on 29.01.2024.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    // To use user's default database
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Hi"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Hello"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "HiToEveryOne"
        itemArray.append(newItem3)
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String : Bool] {
//            itemArray = items
//        }
    }
    
    
    // MARK: - Table view data source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // Swift Ternary Operator =>
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        // Old Ternary Operator =>
        //itemArray[indexPath.row].done ? cell.accessoryType = .checkmark : cell.accessoryType = .none
        return cell
    }
    
    // MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user clicks the Add Item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

