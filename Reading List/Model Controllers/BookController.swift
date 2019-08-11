//
//  BookController.swift
//  Reading List
//
//  Created by Eoin Lavery on 10/08/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookController {
    
    private(set) var books: [Book] = []
    
    var readingListURL: URL? {
        let fileManager = FileManager()
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    var readBooks: [Book] {
        let readBooks = books.filter { $0.hasBeenRead == true }
        return readBooks
    }
    
    var unreadBooks: [Book] {
        let unreadBooks = books.filter {$0.hasBeenRead == false}
        return unreadBooks
    }
    
    private func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print("Error saving books to file: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data.init(contentsOf: url)
            let decodedBooks = try decoder.decode([Book].self, from: data)
            books = decodedBooks
        } catch {
            print("Error retrieving books from file: \(error)")
        }
    }
    
    func createBook(title: String, reasonToRead: String) {
        let bookToCreate = Book(title: title, reasonToRead: reasonToRead)
        books.append(bookToCreate)
        saveToPersistentStore()
    }
    
    func deleteBook(_ book: Book) {
        guard let index = books.index(of: book) else { return }
        books.remove(at: index)
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(_ book: Book) {
        guard let index = books.index(of: book) else { return }
        books[index].hasBeenRead.toggle()
        saveToPersistentStore()
    }
    
    func updateBookInfo(for book: Book, newTitle: String, newReasonToRead: String) {
        guard let index = books.index(of: book) else { return }
        books[index].title = newTitle
        books[index].reasonToRead = newReasonToRead
        saveToPersistentStore()
    }
}