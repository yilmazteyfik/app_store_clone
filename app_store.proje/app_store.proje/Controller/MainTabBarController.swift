//
//  MainTabBarController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//

import UIKit
class MainTabBarController: UITabBarController{
    override func viewDidLoad() {
        view.backgroundColor = .blue
        setup()
    }
}
 // MARK: - Helpers
extension MainTabBarController{
    private func setup(){
        
        viewControllers = [
            createViewController(rootViewController: AppViewController(), title: "Apps", imageName: "square.stack.3d.up"),
            createViewController(rootViewController: SearchViewController(), title: "Saerch", imageName: "magnifyingglass"),
            createViewController(rootViewController: TodayViewController(), title: "Today", imageName: "doc.text.image"),

            
        ]
    }
    private func createViewController(rootViewController: UIViewController, title : String, imageName : String) ->
    UIViewController{
        rootViewController.title = title
        
        let apperence = UINavigationBarAppearance()
        let controller = UINavigationController(rootViewController: rootViewController)
        
        controller.navigationBar.prefersLargeTitles = true
        
        controller.navigationBar.compactAppearance = apperence
        controller.navigationBar.standardAppearance = apperence
        controller.navigationBar.scrollEdgeAppearance = apperence
        controller.navigationBar.compactScrollEdgeAppearance = apperence
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: imageName)
        
        return controller
    }
}
