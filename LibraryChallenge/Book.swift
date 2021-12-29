//
//  Library.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import Foundation

class Book : Identifiable, Decodable {
    
    var title : String
    var author : String
    var isFavorite : Bool
    var currentPage : Int
    var rating : Int
    var id : Int
    var content : [String]

    
}
