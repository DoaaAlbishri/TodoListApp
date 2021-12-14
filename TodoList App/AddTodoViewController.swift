//
//  AddToDoViewController.swift
//  TodoList App
//
//  Created by admin on 13/12/2021.
//

import UIKit

class AddTodoViewController: UIViewController {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
        
        @IBOutlet weak var todoTitle: UITextField!
        @IBOutlet weak var todoNote: UITextField!
        @IBOutlet weak var todoDueDate: UIDatePicker!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        @IBAction func addItemButton(_ sender: UIButton) {
            if todoTitle.text!.isEmpty || todoNote.text!.isEmpty{
                dismiss(animated: true, completion: nil)
            }else{
                let todo = TodoList(context: context)
                todo.title = todoTitle.text!
                todo.note = todoNote.text!
                todo.dueDate = todoDueDate.date
                
                saveContext()
                dismiss(animated: true, completion: nil)
            }
        }
    }
