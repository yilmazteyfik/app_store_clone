//
//  AppHeaderViewModel.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 13.04.2024.
//

import Foundation
struct AppHeaderViewModel {
    let result : AppHeaderModel
    init(result: AppHeaderModel) {
        self.result = result
    }
    var imageUrl : URL? {
        return URL(string: result.imageUrl)
    }
    var title : String?{
        return result.title
    }
    var id : String?{
        return result.id
    }
    var name : String?{
        return result.name
    }
}
