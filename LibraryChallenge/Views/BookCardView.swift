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
                
            VStack(alignment: .leading, spacing: 0){
                Text(book.title)
                    .font(Font.custom("Avenir Heavy", size: 28))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                Text(book.author)
                    .font(Font.custom("Avenir", size: 18))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .padding(30)
                
            }
            
        }
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView(book: BookModel().books[0])
    }
}
