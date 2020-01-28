//
//  BookController.swift
//  Reading List
//
//  Created by Chris Gonzales on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books = [Book]()
    var readingListURL: URL?{
        
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        
        let listURL = documentsDir.appendingPathComponent("ReadingLIst.plist")
        
        return listURL
    }
    
    func saveToPersistentStore(){
        
        guard let readingListURL = readingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do{
            let booksData = try encoder.encode(books)
            try booksData.write(to: readingListURL)
            
            
        } catch {
            print("Error encoding books array: \(error)")
        }
    }
    
    func loadFromPersistnetStore (){
        
        guard let readingListURL = readingListURL else { return }
        
        do{
            let decoder = PropertyListDecoder()
            
            let readingListData = try Data(contentsOf: readingListURL)
            
            let readingListArray = try decoder.decode([Book].self, from: readingListData)
        } catch{
            print("Error decoding readList: \(error)")
        }
    }
}
