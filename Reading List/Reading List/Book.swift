//
//  Book.swift
//  Reading List
//
//  Created by Sezen Bozdogan on 12.11.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool? = false
    
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool? = nil) {
        
        
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead ?? false
    }
}



