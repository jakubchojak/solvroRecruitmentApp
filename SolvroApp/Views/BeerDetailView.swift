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
            self.isLiked = hasItem(beerContainerList: allBeers, beer: beer)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isLiked.toggle()
                    if !hasItem(beerContainerList: allBeers, beer: self.beer) {
                        allBeers.append(BeerContainer(beer: self.beer, liked: true))
                    }
                    else {
                        for (idx, _) in allBeers.enumerated() {
                            if allBeers[idx].beer.isEqual(beer: self.beer) {
                                allBeers[idx].liked.toggle()
                            }
                        }
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
