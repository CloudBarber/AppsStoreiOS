//
//  App.swift
//  MidtermMakeup
//
//  Created by Evans, Jonathan on 5/2/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import Foundation
import SwiftyJSON
class App {
    var artistName:String?
    var id:String?
    var releaseDate:String?
    var name:String?
    var artworkUrl100:URL?
    var genres = [String]()
    
    init(json: JSON) {
        self.artistName = json["artistName"].stringValue
        self.id = json["id"].stringValue
        self.releaseDate = json["releaseDate"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].url
        self.name = json["name"].stringValue
        
        let genresArray = json["genres"].arrayValue
        
        for item in genresArray {
            self.genres.append(item["name"].stringValue)
        }
        
    }
    
}
