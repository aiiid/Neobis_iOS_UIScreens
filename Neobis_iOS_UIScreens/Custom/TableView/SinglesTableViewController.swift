//
//  SinglesTableViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 29/05/2024.
//

import UIKit

class SinglesTableViewController: UITableViewController {
    var singlesData: [SinglesContent] = [
        SinglesContent(
            title: "SOS",
            description: "Mini meltdown? Get some Headspace in a hurry",
            imageName: "Book.png"
        ),
        SinglesContent(
            title: "On-the-Go",
            description: "Mindful living? Get your Headspace to go",
            imageName: "Bookshelf.png"
        ),
        SinglesContent(
            title: "Classic",
            description: "Like it simple? Get some extra Headspace",
            imageName: "Diploma.png"
        ),
        SinglesContent(
            title: "SOS",
            description: "Mini meltdown? Get some Headspace in a hurry",
            imageName: "Globus.png"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            SinglesTableViewCell.self,
            forCellReuseIdentifier: SinglesTableViewCell.reuseIdentifier
        )
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singlesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SinglesTableViewCell.reuseIdentifier,
            for: indexPath) as? SinglesTableViewCell {
            
            cell.configureCell(
                title: singlesData[indexPath.row].title,
                description: singlesData[indexPath.row].description,
                imageName: singlesData[indexPath.row].imageName,
                index: indexPath.row
            )
            
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            print("Error: Unable to dequeue cell of type SinglesTableViewCell")
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}
