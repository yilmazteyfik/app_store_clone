//
//  AppViewController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//

import UIKit

class AppViewController : UIViewController{
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension AppViewController{
    private func style(){
        view.backgroundColor = .green
    }
    private func layout(){
        
    }
}
