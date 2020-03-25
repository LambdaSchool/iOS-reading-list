//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Chris Dobek on 3/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: class {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
