//
//  BookModel.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import Foundation

class BookModel : ObservableObject {
    
    @Published var books = [Book]() // array of json object
    
    init() {
        
        //create an instance of data service and get the data
        self.books = DataService().getLocalData()
        
    }
    
    
    func updateFavourite(forID: Int) {
        if let index = books.firstIndex(where: { $0.id == forID }) {
            books[index].isFavourite.toggle()
        }
    }

    func updateRating(forID: Int, rating:Int) {
        if let index = books.firstIndex(where: {$0.id == forID}) {
            books[index].rating = rating
        }
    }
    
    func updatePage(forID: Int, page:Int) {
        if let index = books.firstIndex(where: {$0.id == forID}) {
            books[index].currentPage = page
        }
    }
    
}
