//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Bobby Keffury on 8/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell) 
}
