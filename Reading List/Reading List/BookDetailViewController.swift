//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Moin Uddin on 9/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViews() {
        if let book = book {
            bookTextField?.text = book.title
            reasonToReadTextView?.text = book.reasonToRead
            title = book.title
        }
        title = "Add a new book"
    }
    
    @IBAction func addBook(_ sender: Any) {
        guard let bookTitle = bookTextField.text,
            let reasonToRead = reasonToReadTextView.text
            else { return }
        if let book = book {
            //Update
            bookController?.updateBookDetails(book: book, title: bookTitle, reasonToRead: reasonToRead)
        } else {
            //Create
            bookController?.createBook(title: bookTitle, reasonToRead: reasonToRead)
        }
        navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    var bookController: BookController?
    var book: Book?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
