//
//  ViewController.swift
//  AdvancedToDoApp
//
//  Created by Виктор on 05.07.17.
//  Copyright © 2017 Виктор. All rights reserved.
//

import UIKit
import CoreData

var massiv: [Task] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    func getData() {
        do {
            massiv = try context.fetch(Task.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massiv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let task = massiv[indexPath.row]
        cell.textLabel?.text = task.taskToDo
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let rowAction = UITableViewRowAction(style: .destructive, title: "Delete") {
            _, _ in

            let task = massiv[indexPath.row]
            self.context.delete(task)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                massiv = try self.context.fetch(Task.fetchRequest())
            } catch {
                print("Fetching failed")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
            
        return [rowAction]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

