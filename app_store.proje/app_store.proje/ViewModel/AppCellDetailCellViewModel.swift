//
//  AppCellDetailCellViewModel.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import Foundation
struct AppCellDetailCellViewModel {
    let result : FeedResult
    init(result: FeedResult) {
        self.result = result
    }
    var appImageUrl : URL?{
        return URL(string: result.artworkUrl100)
    }
    var artistName : String?{
        return result.artistName
    }
    var name : String?{
        return result.name
    }
    
}
