//
//  SelectRoomTypeTableViewController.swift
//  BallasHotel
//
//  Created by Isaac Ballas on 12/18/18.
//  Copyright © 2018 Isaac Ballas. All rights reserved.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType)
}
class SelectRoomTypeTableViewController: UITableViewController {
    var roomType: RoomType?
    var delegate: SelectRoomTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        let roomType = RoomType.all[indexPath.row]
        // Populate the cell
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        //if the roomtype for the row is equal to the selected room type the accesory is .checkmark, otherwise it is .none
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Set the roomType Property to the room type that corresponds to the index path.
        roomType = RoomType.all[indexPath.row]
        delegate?.didSelect(roomType: roomType!)
        tableView.reloadData()
    }
   

}
