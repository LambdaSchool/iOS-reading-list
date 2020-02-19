//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_259 on 2/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
    
    // MARK: IBActions
    @IBAction func readButtonTapped(_ sender: Any) {
        //readButton.isSelected.toggle()
        delegate?.toggleHasBeenRead(for: self)
    }
    
    // MARK: Properties
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    var delegate: UpdateHasBeenReadDelegate?
    

    func updateViews() {
        guard let book = book, !book.title.isEmpty else { return }
        titleLabel.text = book.title
        let checkedImage = UIImage(named: "checked")!
        let uncheckedImage = UIImage(named: "unchecked")!
        let checkImage = book.hasBeenRead ? checkedImage : uncheckedImage
        readButton.setImage(checkImage, for: .normal)
//        if book.hasBeenRead {
//            readButton.setImage(UIImage(named: "checked"), for: .normal)
//        } else {
//            readButton.setImage(UIImage(named: "unchecked"), for: .normal)
//        }
    }

}
