//
//  Extension.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 11.04.2024.
//

import UIKit

extension UIImageView{
    func customMode(){
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    func screenShot(){
        layer.cornerRadius = 12
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.80
    }
}
