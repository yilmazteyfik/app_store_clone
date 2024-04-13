//
//  AppHeaderViewController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import UIKit
private let reuseIndentifier = "AppHeaderViewCell"
class AppHeaderViewController : UICollectionViewController{
    // MARK: - Properties
    var appHeaderResult : [AppHeaderModel] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    // MARK: - Lifecycles
    init(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
// MARK: - Helpers
extension AppHeaderViewController{
    private func style(){
        collectionView.register(AppHeaderViewCell.self, forCellWithReuseIdentifier: reuseIndentifier)
        
    }
    private func layout(){
        
    }
}
// MARK: - UICollectionVİew Data Source

extension AppHeaderViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appHeaderResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath) as! AppHeaderViewCell
        cell.appHeaderModel = self.appHeaderResult[indexPath.row]
        return cell
    }
}
extension AppHeaderViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }

}


