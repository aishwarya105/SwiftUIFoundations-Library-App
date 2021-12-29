//
//  BookRatingView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct BookRatingView: View {
    
    @EnvironmentObject var model:BookModel
    //TO DO :
    //make the star tappable and store the state for that book
    //left align the book title
    var book:Book
    
    @State var starSelection = false
    @State var rating = 1
    @State var isBookDetailViewShowing = false
    
    
    var body: some View {
        VStack{
            Text(book.title)
                .font(Font.custom("Avenir Heavy", size: 28))
            Spacer()
            Text("Read now!")
                .multilineTextAlignment(.center)
                .font(Font.custom("Avenir", size: 24))
            
            
            NavigationLink(destination: {BookDetailView(content : book.content)}, label: {Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .padding(60)
            })
            
            
            Text(book.isFavourite ? "Added to favorites": "Add to favorites")
                .font(Font.custom("Avenir", size: 20))
                        
            Button(action: {model.updateFavorite(forID: book.id)}, label: {
                Image(systemName: book.isFavourite ? "star.fill": "star")
            }).padding(.bottom, 50)
                .accentColor(.yellow)
                
            
            Text("Rate \"\(book.title)\"")
                .font(Font.custom("Avenir", size: 20))
            Picker("", selection: $rating) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(.segmented)
                .frame(width: 200)
            
        }.onAppear{rating = book.rating}
        .onChange(of: rating, perform: {value in model.updateRating(forID: book.id, rating: rating)})

    }
}

struct BookRatingView_Previews: PreviewProvider {
    static var previews: some View {
        
//        let model = BookModel()
        BookRatingView(book: Book())
            .environmentObject(BookModel())
    }
}
