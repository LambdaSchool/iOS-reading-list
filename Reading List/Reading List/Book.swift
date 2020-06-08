//
//  Book.swift
//  Reading List
//
//  Created by Dojo on 6/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct Book: Codable, Equatable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool

    init (title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
    
}
