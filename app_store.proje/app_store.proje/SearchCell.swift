//
//  SearchCell.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//

import UIKit

class SearchCell : UICollectionViewCell{
    // MARK: - Properties
    private let appPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 12
        imageView.widthAnchor.constraint(equalToConstant: 66).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        return imageView
    }()
    private let appScreen1: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemTeal
        return imageView
    }()
    private let appScreen2: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemTeal
        return imageView
    }()
    private let appScreen3: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemTeal
        return imageView
    }()
    
    
    
    
    
    
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "Twitter"
        return label
    }()
    private let catagoryLabel : UILabel = {
       let label = UILabel()
        label.text = "Sosyal Medya"
        return label
    }()
    private let downloadLabel : UILabel = {
       let label = UILabel()
        label.text = "1.9M"
        return label
    }()
    
    private lazy var getButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 55).isActive = true

        return button
    }()
    
    
    private var headerStackView : UIStackView!
    private var labelStackVİew : UIStackView!
    private var appScreenStackView : UIStackView!
    private var TotalAppScreenStackView : UIStackView!


    // MARK: - Lifecycle
    override init(frame: CGRect){
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Helpers
extension SearchCell{
    private func style(){
        labelStackVİew = UIStackView(arrangedSubviews: [
            nameLabel,catagoryLabel,downloadLabel
        ])

        labelStackVİew.distribution  = .fillEqually
        labelStackVİew.axis = .vertical
        
        headerStackView = UIStackView(arrangedSubviews: [
            appPhoto,labelStackVİew,getButton
        ])
        headerStackView.spacing = 12
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        appScreenStackView = UIStackView(arrangedSubviews: [
            appScreen1,appScreen2,appScreen3
        ])
        appScreenStackView.axis = .horizontal
        appScreenStackView.distribution = .fillEqually
        appScreenStackView.spacing = 8
        
        TotalAppScreenStackView = UIStackView(arrangedSubviews: [
            headerStackView,appScreenStackView
        ])
        TotalAppScreenStackView.axis = .vertical
        TotalAppScreenStackView.translatesAutoresizingMaskIntoConstraints = false
        TotalAppScreenStackView.spacing = 8
        
    }
    private func layout(){
        addSubview(TotalAppScreenStackView)
        NSLayoutConstraint.activate([
            TotalAppScreenStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            TotalAppScreenStackView.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 16),
            TotalAppScreenStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -16),
            TotalAppScreenStackView.bottomAnchor.constraint(equalTo: bottomAnchor ),
            
        ])
    }
}