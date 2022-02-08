//
//  ViewController.swift
//  RxReminder
//
//  Created by Sanjida Ayman Nisha on 2/8/22.
//  Copyright © 2022 Sanjida Nisha. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var ref: DatabaseReference!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        self.ref.child("user_id").setValue(123456)
        self.ref.child("name").setValue("Nisha")
        self.ref.child("age").setValue(56)
        
    }
    


}

