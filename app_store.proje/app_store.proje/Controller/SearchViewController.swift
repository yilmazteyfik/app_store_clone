//
//  SearchViewController.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 10.04.2024.
//

import UIKit
private let reuseIdentifier = "SearchCell"
class SearchViewController : UICollectionViewController{
    // MARK: - Properties
    var searchResults : [Result] = [] {
        didSet {collectionView.reloadData()}
    }
    let openingLabel : UILabel = {
       let label = UILabel()
        label.text = "Enter name of app !!!"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
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
    }
}
// MARK: - Helpers
extension SearchViewController{
    private func style(){

        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let searchBar = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBar
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.searchBar.delegate = self
        openingLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout(){
        view.addSubview(openingLabel)
        NSLayoutConstraint.activate([
            openingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32),
            view.trailingAnchor.constraint(equalTo: openingLabel.trailingAnchor, constant: 32)
        ])
    }
}
// MARK: - UICollectionViewDataSource
extension SearchViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        openingLabel.isHidden = self.searchResults.count != 0
        return searchResults.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        cell.result = self.searchResults[indexPath.row]
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 11)
    }
}
// MARK: - UISearchViewController
extension SearchViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchAPI.fetchData(searchtext: searchText) { results in
            self.searchResults = results
        }
    }
}
















