//
//  CountrySelectionViewController.swift
//  TestBottomSheet
//
//  Created by Koh Swee Sen on 8/4/24.
//

import Foundation

import UIKit

class CountrySelectionViewController: BottomSheetViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    private let tableView = UITableView()
    private var countries: [String] = ["USA", "Canada", "Mexico", "Germany", "France", "Italy","USA", "Canada", "Mexico", "Germany", "France", "Italy","USA", "Canada", "Mexico", "Germany", "France", "Italy","USA", "Canada", "Mexico", "Germany", "France", "Italy","USA", "Canada", "Mexico", "Germany", "France", "Italy","USA", "Canada", "Mexico", "Germany", "France", "Italy"] // Example countries

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        // Configure tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Add the tableView to containerView and configure constraints
        containerView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])
    }
    
    // MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    // MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if (scrollView == self.tableView) {
            if offsetY <= 0 {
                scrollView.contentOffset.y = 0
                super.handleSheetPan(self.tableView.panGestureRecognizer)
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView == self.tableView) {
            super.handleSheetPan(self.tableView.panGestureRecognizer)
        }
    }
}

