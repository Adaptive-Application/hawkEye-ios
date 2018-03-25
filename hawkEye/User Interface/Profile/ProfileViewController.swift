//
//  ProfileViewController.swift
//  hawkEye
//
//  Created by PointerFLY on 23/03/2018.
//  Copyright © 2018 PointerFLY. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    init() {
        super.init(style: .grouped)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Me"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [2, 1][section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
            cell.textLabel?.text = "User Name"
            cell.detailTextLabel?.text = KeyValueStore.userName
            return cell
        case (0, 1):
            cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
            cell.textLabel?.text = "Gender"
            cell.detailTextLabel?.text = KeyValueStore.gender?.description
        case (0, 2):
            cell = UITableViewCell()
            cell.textLabel?.text = "Age"
            cell.detailTextLabel?.text = "19"
        case (1, 0):
            cell = UITableViewCell()
            cell.textLabel?.text = "Sign Out"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.red
        default:
            break
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (1, 0):
            let alertController = UIAlertController(title: "Are you sure?", message: "You data might be cleaned if you sign out.", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
                AccountManager.shared.logout()
            }))
            self.present(alertController, animated: true, completion: nil)
        default:
            break
        }
    }
}