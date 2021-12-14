//
//  ViewController.swift
//  TodoList App
//
//  Created by admin on 13/12/2021.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
        
        
        var items : [TodoList] = []
        
        override func viewDidAppear(_ animated: Bool) {
            fetchAllItems()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        // MARK: - Table view data source
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
            
            let todo = items[indexPath.row]
            cell.todoTitle.text = todo.title!
            cell.todoNote.text = todo.note!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            let dateString = dateFormatter.string(from: todo.dueDate!)
            cell.todoDueDate.text = dateString
            
            if todo.check {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }

            return cell
        }
        
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let todo = items[indexPath.row]
            todo.check = !todo.check
            if todo.check {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            }else{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            }
            saveContext()
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            let todo = items[indexPath.row]
            context.delete(todo)
            saveContext()
            items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
        do {
            let results = try context.fetch(request)
            items = results as! [TodoList]
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
    }
    }
