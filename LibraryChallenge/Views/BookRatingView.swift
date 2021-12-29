//
//  BookRatingView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct BookRatingView: View {
    
    
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
            
            Button(action: {
                self.isBookDetailViewShowing = true
            }, label: {
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .padding(60)
            })
                .sheet(isPresented: $isBookDetailViewShowing, content: {BookDetailView(content:book.content)})
                .buttonStyle(PlainButtonStyle())
            
            
            Text("Mark for later")
            if starSelection {
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
            Spacer()
            Text("Rate \(book.title)")
            Picker("", selection: $rating) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(.segmented)
                .frame(width: 200)
            
        }
    }
}

struct BookRatingView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        BookRatingView(book: model.books[0])
    }
}
