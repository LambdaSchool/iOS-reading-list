//
//  BookTableViewCell.swift
//  ReadingList
//
//  Created by Jocelyn Stuart on 1/17/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
    }
    

}
