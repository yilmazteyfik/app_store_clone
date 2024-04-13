//
//  AppHeaderView.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import UIKit

class AppHeaderView : UICollectionReusableView{
    // MARK: - Properties
    private let appHeaderViewController = AppHeaderViewController()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        style()
        layout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Helper
// MARK: - Helpers
extension AppHeaderView{
    private func style(){
        appHeaderViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout(){
        addSubview(appHeaderViewController.view)
        NSLayoutConstraint.activate([
            appHeaderViewController.view.topAnchor.constraint(equalTo: topAnchor),
            appHeaderViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            appHeaderViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appHeaderViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),

            
        ])
    }
}
