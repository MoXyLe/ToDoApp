//
//  AddViewController.swift
//  AdvancedToDoApp
//
//  Created by Виктор on 05.07.17.
//  Copyright © 2017 Виктор. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    //func saveTask(taskToDo: String) {
        
    //}
    
    @IBOutlet weak var noteText: UITextField!
    
    @IBAction func addNote(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.taskToDo = noteText.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //massiv.insert(noteText.text!, at: 0)
        //self.saveTask(taskToDo: noteText.text!)
    }
   
}
