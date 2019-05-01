//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Hector Steven on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setupviews()
    }
	
	@IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
		guard let bookcontroller = bookController else { return }
		if let book = book {
			guard let title = bookTitleTextField.text,
				let reasonToRead = reasonToReadTextView.text else { return }
			
			print("save")
			bookcontroller.upDateBookInfo(book: book, title: title, reasonToRead: reasonToRead)
		}
		
		
//		bookController?.creatBook(title: title, reasonToRead: reasonToReadTextView)
	}
	
	func setupviews(){
		guard let book = book else { return }
		bookTitleTextField?.text = book.title
		reasonToReadTextView?.text = book.reasonToRead
		
	}
	
	@IBOutlet var bookTitleTextField: UITextField!
	@IBOutlet var reasonToReadTextView: UITextView!
	var book: Book? {
		didSet {
			setupviews()
		}
	}
	
	
	var bookController: BookController?
}
