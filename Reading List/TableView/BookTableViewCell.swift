//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Bryan Cress on 5/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var hasReadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func hasReadButtonToggle(_ sender: UIButton) {
    }
    
}
