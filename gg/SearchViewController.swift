//
//  SearchViewController.swift
//  gg
//
//  Created by Josh Hunt on 30/08/2019.
//  Copyright © 2019 Josh Hunt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {
    @IBOutlet public var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .clear
        
        // Create the initial blur effect
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        table.backgroundColor = .clear
        
        // Table view shit
        table.dataSource = self
        table.delegate = self
    }


    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.searchViewControllerDidSelectARow(self)
    }

}
