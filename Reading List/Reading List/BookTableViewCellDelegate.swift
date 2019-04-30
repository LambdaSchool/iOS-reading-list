//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Thomas Cacciatore on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
