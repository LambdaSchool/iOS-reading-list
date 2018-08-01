//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Carolyn Lea on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: class 
{
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
