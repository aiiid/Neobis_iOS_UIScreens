//
//  SinglesViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 28/05/2024.
//

import UIKit
import SnapKit

class SinglesViewController: UIViewController {
    private var singlesTableViewController: SinglesTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        title = "Singles"
        view.backgroundColor = .systemBackground
    
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(leftBarButtonTapped)
        )
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    
    private func configureTableView() {
        // Create an instance of SinglesTableViewController
        singlesTableViewController = SinglesTableViewController(style: .plain)
        
        // Add the SinglesTableViewController as a child view controller
        addChild(singlesTableViewController)
        view.addSubview(singlesTableViewController.view)
        
        // Set up Auto Layout constraints for the SinglesTableViewController's view
        singlesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        singlesTableViewController.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // Notify the SinglesTableViewController that it has been added as a child
        singlesTableViewController.didMove(toParent: self)
    }
    
    @objc func leftBarButtonTapped() {
        // Handle left bar button item tap
        print("left tapped")
    }
    
    @objc func rightBarButtonTapped() {
        // Handle right bar button item tap
        print("right tapped")
    }
}
