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
    
    
}
