//
//  ReadingListVC.swift
//  Reading List
//
//  Created by Jeffrey Santana on 7/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListVC: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	let bookController = BookController()
	
	override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
	
    // MARK: - Navigation
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let manageBookVC = segue.destination as? ManageBookVC {
			manageBookVC.delegate = self
		}
    }

}

extension ReadingListVC: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		print("#Book Sections: \(bookController.filteredBooks.count)")
		return bookController.filteredBooks.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return bookController.filteredBooks[section].category
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("#Books: \(bookController.filteredBooks[section].books.count)")
		return bookController.filteredBooks[section].books.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else { return UITableViewCell() }
		print("Books: \(bookController.filteredBooks[indexPath.section].books)")
		let books = bookController.filteredBooks[indexPath.section].books
		let book = books[indexPath.row]
		
		cell.book = book
		return cell
	}
}

extension ReadingListVC: ManageBookVCDelegate {
	func passBookDetails(title: String, reasonRead reason: String) {
		bookController.createBook(title: title, reason: reason)
		tableView.reloadData()
		navigationController?.popViewController(animated: true)
	}
}
