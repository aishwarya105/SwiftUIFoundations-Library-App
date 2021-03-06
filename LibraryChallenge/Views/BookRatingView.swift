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
    
    @State var rating = 1
    
    
    var body: some View {
        VStack{
            
            NavigationLink(destination: {BookDetailView(book : book)}, label: {
                
                VStack {
                    Text("Read now!")
                        .accentColor(.black)
                        .font(Font.custom("Avenir", size: 24))
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                }
            }).padding()
            
            Text(book.isFavourite ? "Added to favorites": "Add to favorites")
                .font(Font.custom("Avenir", size: 20))
                        
            Button(action: {model.updateFavourite(forID: book.id)}, label: {
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
            }
            .pickerStyle(.segmented)
            .frame(width: 200)
            .onChange(of: rating, perform: {value in model.updateRating(forID: book.id, rating: rating)})
            
        }.onAppear{rating = book.rating}
        .navigationBarTitle("\(book.title)")
        

    }
}

struct BookRatingView_Previews: PreviewProvider {
    static var previews: some View {
        
        BookRatingView(book: Book())
            .environmentObject(BookModel())
    }
}
