//
//  TodayViewController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//


import UIKit

class TodayViewController : UIViewController{
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension TodayViewController{
    private func style(){
        view.backgroundColor = .yellow
    }
    private func layout(){
        
    }
}
