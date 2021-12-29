//
//  ContentView.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:BookModel
    @State var isRatingViewShowing = false
    
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
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)

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
