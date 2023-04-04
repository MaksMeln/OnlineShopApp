//
//  OSTabBarController.swift
//  OnlineShopApp
//
//  Created by Максим Мельничук on 4.04.23.
//

import UIKit

enum Tabs : Int , CaseIterable{
    case home
    case selectedProduct
    case storage
    case message
    case profile
}

final class OSTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureTabBar()
        switchTo(tab: .home)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab : Tabs) {
        selectedIndex = tab.rawValue
    }
    
    
    
//MARK: - CONFIGURETABBAR
    private func configureTabBar() {
        
    
        tabBar.tintColor = Resources.Colors.TabBar.activeTabBar
        tabBar.barTintColor = Resources.Colors.TabBar.inactiveTabBar
        tabBar.backgroundColor = Resources.Colors.Background.tabBarBackgound
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.itemPositioning = .centered
        
        if #available(iOS 15.0, *) {
               let appearance = UITabBarAppearance()
               appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Resources.Colors.Background.tabBarBackgound
               UITabBar.appearance().standardAppearance = appearance
               UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
           }
       
        let controllers: [OSNavBarController] = Tabs.allCases.map { tab in
            let controller = OSNavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: nil ,
                                                 image: Resources.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
        
    
    private func getController(for tab: Tabs) -> OSBaseViewController {
        switch tab {
        case .home:  return OSHomeViewController()
        case .selectedProduct: return OSSelectedProductViewController()
        case .storage: return OSStorageViewController()
        case .message: return OSMessageViewController()
        case .profile: return OSProfileViewController()
        }
    }
}
