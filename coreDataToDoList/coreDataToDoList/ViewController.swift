//
//  ViewController.swift
//  coreDataToDoList
//
//  Created by Raghav Deo on 19/04/22.
//

import UIKit

class ViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func save()
    {
        let context = delegate.persistentContainer.viewContext
        
    }


}

