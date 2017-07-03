//
//  AddViewController.swift
//  ToDoList
//
//  Created by Виктор on 04.07.17.
//  Copyright © 2017 Виктор. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBAction func addButton(_ sender: UIButton) {
        massiv.append(tittle.text!)
    }

    @IBOutlet weak var tittle: UITextField!
    
}
