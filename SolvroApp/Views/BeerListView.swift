//
//  BeerListView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct BeerListView: View {
    @State var beers = [Beer]()
    @State var showFinder = false
    @State var beerToFind = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: UIColor(red: 0.949, green: 0.949, blue: 0.968, alpha: 1.0))
                    .ignoresSafeArea()
                VStack {
                    if showFinder {
                        FinderView(beerToFind: $beerToFind)
                    }
                    List {
                        ForEach(beers) { beer in
                            if beerToFind != "" {
                                if beer.name.contains(beerToFind) {
                                    BeerListItemSubView(beer: beer)
                                }
                            }
                            else {
                                BeerListItemSubView(beer: beer)
                            }
                        }
                    }
                    .task {
                        await self.beers = loadBeersFromAPI() ?? [Beer]()
                    }
                    
                    .navigationTitle("Piwa")
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            withAnimation(.spring()) {
                                showFinder.toggle()
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
        }
    }
}

