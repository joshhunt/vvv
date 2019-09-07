//
//  SearchViewController.swift
//  gg
//
//  Created by Josh Hunt on 30/08/2019.
//  Copyright © 2019 Josh Hunt. All rights reserved.
//

import UIKit
import SDWebImage


struct ItemResult {
    var name: String
    var description: String
    var image: String
}

let SEARCH_RESULTS = [
    ItemResult(name: "Niflheim Frost", description: "Legendary Scout Rifle", image:"https://bungie.net/common/destiny2_content/icons/f6f052956312c966a071fab25ba5e924.jpg"),
    
    ItemResult(name: "Beloved", description: "Legendary Sniper Rifle", image:"https://bungie.net/common/destiny2_content/icons/a804c23a5ad568efe4da68911bacd263.jpg"),
    
    ItemResult(name: "Blast Furnace", description: "Legendary Pulse Rifle", image:"https://www.bungie.net/common/destiny2_content/icons/b163df19bb09e17b7b23abd57b53e38c.jpg"),
    
    ItemResult(name: "The Spiteful Fang", description: "Legendary Combat Bow", image:"https://www.bungie.net/common/destiny2_content/icons/9d7b01999feca60169a8f276ae3cb4a4.jpg"),
    
    ItemResult(name: "Loaded Question", description: "Legendary Fusion Rifle", image:"https://www.bungie.net/common/destiny2_content/icons/a233aa2e2cba2f8a15f998dee8f8a5bd.jpg"),
    
    ItemResult(name: "Riskrunner", description: "Exotic Submachine Gun", image:"https://www.bungie.net/common/destiny2_content/icons/97a3cc17cab25c15b51b1e268886e8d1.jpg"),
    
    ItemResult(name: "Jötunn", description: "Exotic Fusion Rifle", image:"https://www.bungie.net/common/destiny2_content/icons/d1557292804fa517f6298c00ccaed78e.jpg"),
    
    ItemResult(name: "Swarm of the Raven", description: "Legendary Grenade Launcher", image:"https://www.bungie.net/common/destiny2_content/icons/09a51ce23b9e696376e6425a38f615d8.jpg"),
    
    ItemResult(name: "Stryker's Sure-Hand", description: "Legendary Sword", image:"https://www.bungie.net/common/destiny2_content/icons/7ac678df92126b2fb86d81accc5ef004.jpg"),
    
    ItemResult(name: "Bad Omens", description: "Legendary Rocket Launcher", image:"https://www.bungie.net/common/destiny2_content/icons/d7a9848f2de9f598fe8aae242937a5d3.jpg")
]

class SearchViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {
    @IBOutlet public var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4973316461)
        
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
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "itemResultCell")
        let item = SEARCH_RESULTS[indexPath.row];
        cell.backgroundColor = .clear
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.description
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cell.detailTextLabel?.textColor = UIColor.gray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        if let imageView = cell.imageView {
            imageView.sd_setImage(with: URL(string: item.image), placeholderImage: UIImage(named: "missing_icon_d2"))
            imageView.layer.cornerRadius = 5
            imageView.layer.masksToBounds = true
            
            let itemSize = CGSize.init(width: 45, height: 45)
            UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
            let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
            imageView.image!.draw(in: imageRect)
            imageView.image! = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SEARCH_RESULTS.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
