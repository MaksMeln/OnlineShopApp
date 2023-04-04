//
//  OSNavBarController.swift
//  OnlineShopApp
//
//  Created by Максим Мельничук on 4.04.23.
//

import UIKit

final class OSNavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    private func configureAppearance() {
        view.backgroundColor = Resources.Colors.Background.backgroundColor
        navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
    }
}
