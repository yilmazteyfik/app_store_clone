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
        
    }
    private func layout(){
        
    }
}
// MARK: - UICollectionViewDataSource
extension SearchViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        return .init(width: view.frame.width, height: 250)
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
















