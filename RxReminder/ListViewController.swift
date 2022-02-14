//
//  ListViewController.swift
//  RxReminder
//
//  Created by Sanjida Ayman Nisha on 2/13/22.
//  Copyright © 2022 Sanjida Nisha. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    private var service: UserService?
       private var allusers = [appUser]() {
           didSet {
               DispatchQueue.main.async {
                   self.users = self.allusers
               }
           }
       }
       
       var users = [appUser]() {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
           cell.accessoryType = .disclosureIndicator
           cell.textLabel?.text = users[indexPath.row].medName
           cell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
           cell.detailTextLabel?.text = users[indexPath.row].medDes
           return cell
       }
    func loadData() {
          service = UserService()
          service?.get(collectionID: "User") { users in
              self.allusers = users
          }
      }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


