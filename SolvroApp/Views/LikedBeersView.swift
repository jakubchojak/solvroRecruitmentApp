//
//  LikedBeersView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct LikedBeersView: View {
    @State var likedBeers = [Beer]()
    @State var beerToFind = ""
    @State var showFinder = false
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
                        ForEach(likedBeers) { beer in
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
                    .navigationTitle("Ulubione")
                    .onAppear {
                        Task {
                            await self.likedBeers = getLikedBeers()
                        }
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
    
}
