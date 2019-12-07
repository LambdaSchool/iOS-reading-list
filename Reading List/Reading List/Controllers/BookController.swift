//
//  BookController.swift
//  Reading List
//
//  Created by Joshua Rutkowski on 12/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
// MARK: - Properties
    /// Array of book objects
    var books = [Book]() {
        didSet {
            books.sort { $0.title < $1.title }
        }
    }
    /// Returns books that have been read
    var readBooks: [Book] {
        let readBooks = books.filter { $0.hasBeenRead == true }
        return readBooks
    }
    /// Returns book objects that have not been read
    var unreadBooks: [Book] {
        let unreadBooks = books.filter { $0.hasBeenRead == false }
        return unreadBooks
    }
    
    init() {
         loadFromPersistentStore()
     }
//MARK: - Methods

    
    @discardableResult func createBook(named title: String, withReason reason: String) -> Book {
        let book = Book(title, reason)
         books.append(book)
         print("\(unreadBooks)")
         saveToPersistentStore()
         return book
     }

     func deleteBook(named book: Book) {
         guard let index = books.firstIndex(of: book) else { return }
         books.remove(at: index)
         saveToPersistentStore()
     }
    
    func editBook(book: Book, title: String, reasonToRead: String) {
         guard let index = books.firstIndex(of: book) else { return }
          books[index].title = title
          books[index].reasonToRead = reasonToRead
          saveToPersistentStore()
      }

     func updateHasBeenRead(for book: Book) {
         guard let index = books.firstIndex(of: book) else { return }
         books[index].hasBeenRead.toggle()
         saveToPersistentStore()
     }

     func updateReasonOrTitle(for book: Book) {
         guard let index = books.firstIndex(of: book) else { return }
         books[index].title = book.title
         books[index].reasonToRead = book.reasonToRead
         saveToPersistentStore()
     }
    
    
//MARK: - Persistence
    private var readingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let filename = "ReadingList.plist"
        return dir.appendingPathComponent(filename)
    }

    /// Saves changes to a book object in an array
    private func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    /// Loads the property list stored on the device
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = readingListURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let booksData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            books = decodedBooks
        } catch {
            print("Error loading books data: \(error)")
        }
    }
}


