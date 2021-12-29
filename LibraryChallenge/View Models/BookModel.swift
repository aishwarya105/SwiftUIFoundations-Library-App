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
    
    func updateFavorite(forID: Int) {
        //find the first index where book id = to the id being passed
        if let index = books.firstIndex(where: {$0.id == forID }) {
        books[index].isFavourite.toggle()
        //toggle the favorite boolean for that book
    }
}
}
