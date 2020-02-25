//
//  BookController.swift
//  Reading List
//
//  Created by Mark Gerrior on 2/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    var books: [Book] = []

    // This initilizer is treated as the viewDidLoad of the model controller.
    init() {
        loadFromPersistentStore()
    }
    
    var readBooks: [Book] {
        return books.filter { $0.hasBeenRead == true }
    }

    var unreadBooks: [Book] {
        return books.filter { $0.hasBeenRead == false }
    }
    
    // MARK: - CRUD
    
    // Create
    func create(title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
    
    // Read. Not the model
    
    // Update
    func toogleHasBeenRead(book b: Book) {
        var book = b
        book.hasBeenRead = !book.hasBeenRead
        // FIXME: Update member variable and view
    }
    
    func reasonToRead(book b: Book, title: String, reasonToRead: String) {
        var book = b
        book.title = title
        book.reasonToRead = title
        //FIXME: Update member variable and view
    }
    
    // Delete
    func delete(book: Book) {
        //FIXME: delete book from books
    }
    
    // MARK: - Persitance
    var readingListURL: URL? {
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let booksUrl = documentsDir?.appendingPathComponent("books.plist")
        
        return booksUrl
    }
    
    func saveToPersistentStore() {
        // Convert our book Property List
        let encoder = PropertyListEncoder()
        
        do {
            let booksData = try encoder.encode(books) //FIXME: encode(value:
            
            guard let booksUrl = readingListURL else { return }
            
            try booksData.write(to: booksUrl)
            
        } catch {
            print("Unable to save books to plist: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        do {
            guard let readingListURL = readingListURL else { return }
            
            let booksData = try Data(contentsOf: readingListURL)
            
            let decoder = PropertyListDecoder()
            
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            
            self.books = decodedBooks
            
        } catch {
            print("Unable to open books to plist: \(error)")
        }
    }
}
