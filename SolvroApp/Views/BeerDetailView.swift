//
//  BeerDetailView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct BeerDetailView: View {
    @State var beer: Beer
    @State var isLiked = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: beer.image_url), scale: 5.0)
                Text(beer.name)
                    .font(.system(size: 28))
                    .bold()
                    .padding()
                Text("Pierwsze warzenie: " + beer.first_brewed)
                    .italic()
                Text(beer.tagline)
                    .italic()
                    .font(.system(size: 12))
                    .padding(.top, 10)
                Text(beer.description)
                    .padding()
            }
        }
        .onAppear {
            if likedBeersIDs.contains(self.beer.id) {
                self.isLiked = true
            }
            else {
                self.isLiked = false
            }
        }
        .onDisappear {
            saveLikedBeersToDisk()
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isLiked.toggle()
                    if (!likedBeersIDs.contains(self.beer.id)) {
                        likedBeersIDs.append(self.beer.id)
                    }
                    else {
                        likedBeersIDs.remove(at: likedBeersIDs.firstIndex(of: self.beer.id)!)
                    }
                } label: {
                    if isLiked {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                    else {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                    }
                }

            }
        }
    }
}
