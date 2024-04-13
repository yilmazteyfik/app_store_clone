//
//  SearchAPI.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 11.04.2024.
//



import Foundation
import Alamofire
struct SearchAPI{
    static func fetchData(searchtext term: String,completion: @escaping([Result])->Void){
        let baseUrl = "https://itunes.apple.com/search"
        let parameters = ["entity":"software" ,"term":term]
        AF.request(baseUrl,method: .get,parameters: parameters).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                
            }catch let error{
                print(error.localizedDescription)
            }
            
        }
    }
}
