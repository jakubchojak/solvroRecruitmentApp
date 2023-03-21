//
//  LikedBeersView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct LikedBeersView: View {
    @State var likedBeers = [Beer]()
    var body: some View {
        NavigationView {
            List {
                ForEach(likedBeers) { beer in
                    BeerListItemSubView(beer: beer)
                }
            }
            .navigationTitle("Ulubione")
            .onAppear {
                self.likedBeers = getLikedBeers()
            }
        }
    }
    
}
