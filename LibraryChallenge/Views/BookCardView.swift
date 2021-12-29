//
//  BookCardView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct BookCardView: View {
    var book:Book
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
            VStack( alignment: .leading,spacing: 0){
                Text(book.title)
                    .font(Font.custom("Avenir Heavy", size: 28))
                    .padding(.top, 30)
                    .padding(.leading, 40)
                    .foregroundColor(.black)
                Text(book.author)
                    .font(Font.custom("Avenir", size: 18))
                    .padding(.leading, 40)
                    .foregroundColor(.black)
                Image("cover\(book.id)")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                    .padding(40)
                    .padding(.top, 0)
                
            }
            
        }
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookCardView(book: model.books[0])
    }
}
