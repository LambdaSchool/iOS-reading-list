//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by scott harris on 1/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    var bookController: BookController?
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Add a new book"
        
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
       
        guard let title = titleTextField.text,
        let reasonToRead = reasonToReadTextView.text,
            !title.isEmpty, !reasonToRead.isEmpty else { return }
        
        if let book = book {
            bookController?.update(book: book, with: title, and: reasonToRead)
        } else {
            bookController?.createBook(title: title, reasonToRead: reasonToRead)
            
        }
        
        if let parent = navigationController?.viewControllers.first as? ReadingListTableViewController {
            parent.tableView.reloadData()
        }
        navigationController?.popViewController(animated: true)

    }
    
    func updateViews() {
        if let book = book {
            title = book.title
            titleTextField.text = book.title
            reasonToReadTextView.text = book.reasonToRead
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
