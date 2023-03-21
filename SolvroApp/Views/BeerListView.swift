//
//  BeerListView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct BeerListView: View {
    @State var beers = [Beer]()
    var body: some View {
        NavigationView {
            List {
                ForEach(beers) { beer in
                    BeerListItemSubView(beer: beer)
                }
            }
            .task {
                await self.beers = loadBeersFromAPI() ?? [Beer]()
            }
            
            .navigationTitle("Piwa")
        }
    }
}

