//
//  AppCellDetail.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import UIKit
import Kingfisher

class AppCellDetail : UICollectionViewCell{
    // MARK: - Properties
    var result : FeedResult?{
        didSet{
            configure()
        }
    }
    private let appIcon : UIImageView = {
        let imageView =  UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple

        return imageView
    }()
    private let nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "App Name"
        return nameLabel
    }()
    private let firmLabel : UILabel = {
        let firmLabel = UILabel()
        firmLabel.text = "Frim Name"
        return firmLabel
    }()
    private lazy var getButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.blue,for: .normal)
        button.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return button
    }()
    var labelStackView = UIStackView()
    var mainStackView = UIStackView()
    
    
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
extension AppCellDetail{
    private func style(){

        labelStackView = UIStackView(arrangedSubviews: [nameLabel,firmLabel])
        labelStackView.axis = .vertical
        
        mainStackView = UIStackView(arrangedSubviews: [appIcon, labelStackView, getButton])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        getButton.layer.cornerRadius = 34 / 2
        appIcon.layer.cornerRadius = 10
       
    }
    private func layout(){
        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 80),
            appIcon.heightAnchor.constraint(equalToConstant: 70),
            
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 34),
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

        ])
        
        
    }
    private func configure(){
        guard let result = self.result else {
            print("AppCellDetail Configure() ERROR")
            return
        }
        let model = AppCellDetailCellViewModel(result: result)
        
        self.nameLabel.text = model.name
        self.firmLabel.text = model.artistName
        self.appIcon.kf.setImage(with: model.appImageUrl)
    }
}
