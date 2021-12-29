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
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
            VStack( alignment: .leading,spacing: 10){
                HStack {
                    Text(book.title)
                        .font(Font.custom("Avenir Heavy", size: 28))

                        .foregroundColor(.black)
                    Spacer()
                    if book.isFavourite{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                        
                    }
                }
                Text(book.author)
                    .italic()
                    .font(Font.custom("Avenir", size: 18))
                    .foregroundColor(.black)
                    
                Image("cover\(book.id)")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fill)

                
            }.padding()
            
        }
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookCardView(book: model.books[0])
            .environmentObject(BookModel())
    }
}
