//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Morgan Smith on 12/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
