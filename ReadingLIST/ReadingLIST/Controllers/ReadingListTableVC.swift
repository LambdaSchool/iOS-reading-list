//
//  ViewController.swift
//  ReadingLIST
//
//  Created by Nick Nguyen on 1/28/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ReadingListTableVC: UITableViewController , BookTableViewDelegate {

    let bookController = BookController()
    
    func toggleHasBeenRead(for cell: BookTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return } //
        let book = bookFor(indexPath: indexPath) // 
        bookController.updateHasBeenRead(for:book)
     tableView.reloadData()

    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return bookController.readBooks.count
        case 1:
            return bookController.unreadBooks.count
        default:
            break
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.cellId, for: indexPath) as! BookTableViewCell
        cell.book = bookFor(indexPath: indexPath) //
        cell.delegate = self
       
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bookController.books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Read Books"
            
        default:
            return "Unread Books"
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Helper.bookSegue {
            guard let destVC = segue.destination as? BookDetailVC else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            destVC.book = bookFor(indexPath: indexPath)
            destVC.bookController = bookController
        } else if segue.identifier == Helper.addSegue {
            guard let destVC = segue.destination as? BookDetailVC else { return }
            destVC.bookController = bookController
      
        }
    }
  
    private func bookFor(indexPath: IndexPath) -> Book {
        if indexPath.section == 0 {
            return bookController.readBooks[indexPath.row]
        } else {
            return bookController.unreadBooks[indexPath.row]
        }
    }

}
