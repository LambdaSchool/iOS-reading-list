//
//  BookController.swift
//  Reading List
//
//  Created by Nichole Davidson on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController: BookTableViewCellDelegate {
    
    var books: [Book]

    init(books: [Book]) {
        self.books = books
    }

var readingListURL: URL? {
    
    let fileManager = FileManager.default
    
    guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    let readingURL = documentsDir.appendingPathComponent("ReadingList.plist")
    
    return readingURL
}

func saveToPersistentStore() {
    
    guard let fileURL = readingListURL else { return }
    
    let encoder = PropertyListEncoder()
    
    do {
        
        let booksData = try encoder.encode(books)
        try booksData.write(to: fileURL)
        
    } catch {
        print("Error encoding books array: \(error)")
       
    }
 }
 
    func loadFromPersistentStore() {
        
        do {
            guard let fileURL = readingListURL else { return }
            let booksData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            self.books = decodedBooks
        } catch {
            print("Error decoding books: \(error)")
        }
        
    }
    
    
    /////////////

     func createBook(with title: String, reasonToRead: String, hasBeenRead: Bool) {
           
           let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
           
           books.append(book)
           
           saveToPersistentStore()
       }
    
     func deleteBook(with title: String, reasonToRead: String, hasBeenRead: Bool) {

        
//        func toggleHasBeenRead(for cell: BookTableViewCell) {
//            books.removeAll()
//        }
         let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)

        if book.hasBeenRead == true {
               books.removeAll() //does this remove all the titles or just the 'true' titles?
        }
        
        saveToPersistentStore()
        
    }
    
     func updateHasBeenRead(for book: Book) {
        
        func toggleHasBeenRead(for cell: BookTableViewCell) {
            
        }
            
        }
        
         saveToPersistentStore()
     
         //part 1 - step 6
     }

     func updateBookTitle() {

     saveToPersistentStore()
        
     }
     
        var readBooks: [Book] {

            let books = [Book].self

            var readBookList = books.filter { }

            return books
            saveToPersistentStore()
     }
    
        var unreadBooks: [Book] {
               
               let books = [Book].self
               var unreadBookList = books.filter(books.)
               
               saveToPersistentStore()
           }

}
