//
//  ViewController.swift
//  Todoey-Section-19
//
//  Created by Abdurahman on 29.01.2024.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Hello", "Hi", "Hello again"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    // MARK: - Table view data source methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
}

