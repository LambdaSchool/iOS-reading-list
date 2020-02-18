//
//  Book.swift
//  Reading List
//
//  Created by Breena Greek on 2/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool = false
}
