//
//  OSBaseViewController.swift
//  OnlineShopApp
//
//  Created by Максим Мельничук on 4.04.23.
//

import UIKit

class OSBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearence()
    }
}

@objc extension OSBaseViewController {
    
    func setupViews() {}
    func constraintViews() {}
    func configureAppearence() {
        view.backgroundColor = Resources.Colors.Background.backgroundColor
    }
}
