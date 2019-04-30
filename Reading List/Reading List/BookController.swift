//
//  BookController.swift
//  Reading List
//
//  Created by Hector Steven on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
	
	func updateBookInformation(book: Book, title: String?,reasonToRead: String?) {
		if let index = getBookIndex(book: book) {
			if let title = title {
				books[index].title = title
			}
			
			if let reasonToRead = reasonToRead {
				books[index].reasonToRead = reasonToRead
			}
		}
	}
	
	func updateHasBeenRead(for book: Book) {
		if let index = getBookIndex(book: book) {
			books[index].hasBeenRead.toggle()
		}
	}
	
	func deleteBook(book: Book) {
		if let index = getBookIndex(book: book){
			books.remove(at: index)
			saveToPersistentStore()
		}
	}
	
	func creatBook(title: String, reasonToRead: String){
		let book = Book(title: title, reasonToRead: reasonToRead)
		books.append(book)
		
		saveToPersistentStore()
	}
	
	private(set) var books: [Book] = []
}


extension BookController {
	///will load data from Persistent if it exist
	func loadFromPersistentStore() {
		//make sure file exist
		let fileManager = FileManager.default
		guard let url = readingListURL,
			fileManager.fileExists(atPath: url.path) else {
				print("error: loadFromPersistentStore()")
				return
		}
		
		// load and decoode data
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			let decodedBooks = try decoder.decode([Book].self, from: data)
			books = decodedBooks
		}catch {
			NSLog("Error loading book data: \(error)")
		}
	}
	
	///will save data to persistent store
	func saveToPersistentStore() {
		guard let url = readingListURL else { return }
		do {
			//Create an instance of PropertyListEncoder
			let encoder = PropertyListEncoder()
			//encode books data
			let data = try encoder.encode(books)
			//encode the books array into Data
			try data.write(to: url)
		} catch {
			NSLog("Error saving book data: \(error)")
		}
	}
	
	private func getBookIndex(book: Book) -> Int? {
		guard let index = books.firstIndex(of: book) else {
			return nil
		}
		return index
	}
	
	private var readingListURL: URL? {
		//Get the user's document directory using the FileManager class.
		let fileManager = FileManager.default
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		
		//Create a filename string for the plist, such as "ReadingList.plist"
		let fileName = "ReadingList.plist"
		
		//Return a url that appends the filename string to the document directory.
		let document = documents.appendingPathComponent(fileName)
		
		print(document)
		return document
	}
}
