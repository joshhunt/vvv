//
//  SearchViewController.swift
//  gg
//
//  Created by Josh Hunt on 30/08/2019.
//  Copyright © 2019 Josh Hunt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

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
        
        // Then the vibrancy effect
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
//        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
//        vibrancyView.contentView.addSubview(actualSearchView)
//        blurView.contentView.addSubview(vibrancyView)
        
//        NSLayoutConstraint.activate([
//            vibrancyView.heightAnchor.constraint(equalTo: blurView.contentView.heightAnchor),
//            vibrancyView.widthAnchor.constraint(equalTo: blurView.contentView.widthAnchor),
//            vibrancyView.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor),
//            vibrancyView.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor)
//        ])
        
//        NSLayoutConstraint.activate([
//            optionsView.centerXAnchor.constraint(equalTo: vibrancyView.contentView.centerXAnchor),
//            optionsView.centerYAnchor.constraint(equalTo: vibrancyView.contentView.centerYAnchor),
//        ])
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
