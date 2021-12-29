//
//  BookDetailView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model:BookModel
    var book:Book
    
    @State private var page = 0
    
    var body: some View {
        TabView(selection: $page){

            ForEach(book.content.indices){index in
                VStack{
                    Text(book.content[index]).tag(index)
                    Spacer()
                    Text("\(page+1)")
                }.padding()
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onAppear{page = book.currentPage}
        .onChange(of: page, perform: {value in model.updatePage(forID: book.id, page: page)})
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(book: model.books[0]).environmentObject(BookModel())
    }
}
