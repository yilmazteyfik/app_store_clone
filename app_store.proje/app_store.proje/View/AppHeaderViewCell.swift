//
//  AppHeaderViewCell.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import UIKit

class AppHeaderViewCell : UICollectionViewCell{
    // MARK: - Properties
    private let appImage : UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemMint
        return imageView
    }()
    private let firmLabel : UILabel = {
        let label = UILabel()
        label.text = "Linkedin"
        label.textColor = .blue
        return label
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "LVLKJBCLKJABSLKJHJVJAGSVCJHASVCLHJAVSCLHVCLHJVLHCSVSLJHAVCŞHAVSCHJKAVSCKHVSCJHVASC"
        return label
    }()
    
    var stackView = UIStackView()
    // MARK: - Lifecycle
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension AppHeaderViewCell{
    private func style(){
        stackView = UIStackView(arrangedSubviews: [firmLabel, titleLabel, appImage])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
                                    ])
    }
}
