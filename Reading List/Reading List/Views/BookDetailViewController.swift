//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Joel Groomer on 8/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var txtBookTitle: UITextField!
    @IBOutlet weak var txtvReasonToRead: UITextView!
    
    var bookController: BookController?
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveTapped(_ sender: Any) {
        guard let title = txtBookTitle.text, let reason = txtvReasonToRead.text,
            title != "", reason != ""
        else {
            return
        }
        
        if let book = book {
            self.book = bookController?.updateBook(for: book, newTitle: title, newReason: reason)
        } else {
            self.book = bookController?.addBook(named: title, reasonToRead: reason)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        if let book = book {
            txtBookTitle.text = book.title
            txtvReasonToRead.text = book.reasonToRead
        } else {
            title = "Add a new book"
        }
    }
}
