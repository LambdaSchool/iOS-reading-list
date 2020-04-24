//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by admin on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHassBeenRead(for cell: BookTableViewCell)
}
