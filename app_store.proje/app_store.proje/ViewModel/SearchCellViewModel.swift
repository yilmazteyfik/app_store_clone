//
//  SearchCellViewModel.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 11.04.2024.
//

import Foundation

struct SearchCellViewModel{
    let result : Result?
    init(result: Result?) {
        self.result = result
    }
    var ratingLabel: String?{
        return String(format: "%.2f", result?.averageUserRating ?? 0)
    }
    var nameLabel: String?{
        return result?.trackName
    }
    var catagoryLabel: String?{
        return result?.primaryGenreName
    }
    var appImage : URL?{
        return URL(string: result?.artworkUrl100 ?? "error")
    }
    
    var appInfoPhoto_1: URL?{
        return URL(string: result?.screenshotUrls[0] ?? "error")
    }
    var appInfoPhoto_2: URL?{
        return URL(string: result?.screenshotUrls[1] ?? "error")
    }
    var appInfoPhoto_3: URL?{
        return URL(string: result?.screenshotUrls[2] ?? "error")
    }
}
