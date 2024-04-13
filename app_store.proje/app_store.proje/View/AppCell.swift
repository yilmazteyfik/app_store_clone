//
//  AppCell.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 12.04.2024.
//

import UIKit

class AppCell : UICollectionViewCell{
    // MARK: - Properties
    var feed : Feed?{
        didSet{
            configure()
        }
    }
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Label"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    private let appCellViewController = AppCellController()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension AppCell{
    private func style(){
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        appCellViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(sectionLabel)
        addSubview(appCellViewController.view)
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            appCellViewController.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor),
            appCellViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor ),
            appCellViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor),

            
        ])
        
    }
    private func configure(){
        guard let feed = self.feed else {
            printContent("AppCell Configure Error")
            return
        }
        self.sectionLabel.text = feed.title
        self.appCellViewController.results = feed.results
    }
}
