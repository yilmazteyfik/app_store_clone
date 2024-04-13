//
//  AppModel.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import Foundation
struct AppModel : Decodable{
    let feed : Feed
}

struct Feed : Decodable {
    let title : String
    let results : [FeedResults]
}
struct FeedResults : Decodable {
    let name : String
    let artisName : String
    let artworkurl100 : String
}
