//
//  UpdateHasBeenReadDelegate.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_259 on 2/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


protocol UpdateHasBeenReadDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
