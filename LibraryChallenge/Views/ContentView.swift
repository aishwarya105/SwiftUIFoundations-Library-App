//
//  ContentView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    var bookmodel = BookModel()
    var body: some View {
        VStack {

            Text("Hello, book lover! \(bookmodel.books[0].author)")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
