//
//  BeerListItemSubView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct BeerListItemSubView: View {
    @State var beer: Beer
    var body: some View {
        NavigationLink {
            BeerDetailView(beer: beer)
        } label: {
            HStack {
                Text(beer.name)
                Spacer()
                AsyncImage(url: URL(string: beer.image_url), scale: 25.0)
            }
        }
    }
}
