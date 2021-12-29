//
//  BookDetailView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct BookDetailView: View {
    
    var allcontent = ""
    
    init(content:[String]) {
        
        for index in (0..<content.count) {
            if index == content.count-1 {
                allcontent += content[index]
            } else {
                allcontent += content[index] + "\n"
            }
        }
        
    }
    
    var body: some View {
        Text(allcontent)
            .padding()
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(content: model.books[0].content)
    }
}
