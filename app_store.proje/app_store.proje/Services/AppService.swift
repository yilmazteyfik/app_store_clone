//
//  AppService.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import Foundation
import Alamofire

struct AppService{
    static func fetchData(urlString : String, completion : @escaping(Feed) -> Void){
        guard let url = URL(string: urlString) else { return }
        AF.request(url, method: .get).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            //print(String(data: data, encoding: .utf8))
            do {
                let response = try JSONDecoder().decode(AppModel.self, from: data)
                completion(response.feed)
            } catch let error{
                print(error.localizedDescription)
            }
            
        }

    }
    
}
