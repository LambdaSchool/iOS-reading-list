//
//  Book.swift
//  Reading List
//
//  Created by David Williams on 2/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool = false
    
    mutating func toggleHasBeenRead () {
        self.hasBeenRead = !self.hasBeenRead
    }
    
}
