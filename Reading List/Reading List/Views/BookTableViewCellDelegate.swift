//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Dustin Koch on 1/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate : class {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
    
    
}
