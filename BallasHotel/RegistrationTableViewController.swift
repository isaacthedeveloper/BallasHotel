//
//  RegistrationTableViewController.swift
//  BallasHotel
//
//  Created by Isaac Ballas on 12/18/18.
//  Copyright © 2018 Isaac Ballas. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        // Configure the cell...
        let registration = registrations[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " +
        dateFormatter.string(from: registration.checkOutDate) + ": "
        + registration.roomChoice.name
        return cell
    }
    
    @IBAction func unwindFromAddRegistration(unwindSegue:
        UIStoryboardSegue) {
          
        guard let addRegistrationTableViewController =
            unwindSegue.source as? AddRegistrationTableViewController,
            let registration =
            addRegistrationTableViewController.registration else
        { return }
          
        registrations.append(registration)
        tableView.reloadData()
    }
    

}
