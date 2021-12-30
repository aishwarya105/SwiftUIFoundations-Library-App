//
//  ContentView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//


//Checking if changes are pushing to github
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:BookModel
    
    var body: some View {
        VStack{
            

            NavigationView {
                ScrollView {

                        
                        LazyVStack {
                            
                            ForEach (0..<model.books.count) { index in
                            
                                
                                NavigationLink(destination: {BookRatingView(book : model.books[index])}, label: {BookCardView(book:model.books[index])
                                        .padding([.leading, .trailing], 20)
                                })
                                
                            }
                        }
                }.navigationTitle("My Library")

            }
        }

            
            
        }
        
        
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BookModel())
    }
}
