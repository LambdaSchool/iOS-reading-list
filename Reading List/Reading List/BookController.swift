//
//  BookController.swift
//  Reading List
//
//  Created by Victor  on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class BookController {
    var books: [Book] = []
    
    var readBooks: [Book] {
        var array: [Book] = []
        for book in books {
            if book.hasBeenRead {
                array += [book]
            }
        }
        return array
    }
    
    var unreadBooks: [Book] {
        var array: [Book] = []
        for book in books {
            if book.hasBeenRead {
                array += [book]
            }
        }
        return array
    }
    
    
    var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return document.appendingPathComponent("books.plist")
    }
    
    func addBook(title: String, reasonToRead: String, hasBeenRead: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        books.append(book)
        saveToPersistenceStore()
    }
    
    func deleteBook(book: Book) {
        //delete book
    }
    
    func updateBookHasBeenRead(for book: Book) {
        //update books has been read property
    }
    
    func updateBookDetails(for book: Book) {
        //update book title and or reason to read properties
    }
    
    
    func saveToPersistenceStore() {
        guard let url = readingListURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    
    func loadToPersistentStore() {
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let booksData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: booksData)
        } catch {
            print(error)
        }
    }
}
