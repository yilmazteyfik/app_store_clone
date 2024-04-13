//
//  AppViewController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//

import UIKit
private let reuseIdentifier = "AppCell"
private let reuseHeadeerIdentifier = "AppHeaderCell"


class AppViewController : UICollectionViewController{
    // MARK: - Properties
    // MARK: - Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        fetchDetailData()
    }
}
// MARK: - Helpers
extension AppViewController{
    private func style(){
        view.backgroundColor = .green
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(AppHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)

    }
    private func layout(){
        
    }
}
// MARK: - Service

extension AppViewController{
    private func fetchDetailData(){
        AppService.fetchData(url: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json") { Feed in
            <#code#>
        }
        
    }
}

// MARK: - UICollectionView Data Source
extension AppViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCell

        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath)
        return header
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension AppViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}