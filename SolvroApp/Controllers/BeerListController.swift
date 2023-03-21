//
//  BeerListController.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import Foundation

var allBeers = [BeerContainer]()

func loadBeersFromAPI() async -> [Beer]? {
    guard let baseURL = URL(string: "https://api.punkapi.com/v2/beers/") else { return nil }
    var beersFetched = [Beer]()
    
    do {
        let (data, _) = try await URLSession.shared.data(from: baseURL)
        if let response = try? JSONDecoder().decode([Beer].self, from: data) {
           beersFetched = response
        }
    }
    catch {
        print("Error while receiving data")
    }
    
    return beersFetched
}

func hasItem(beerContainerList: [BeerContainer], beer: Beer) -> Bool {
    
    for item in beerContainerList {
        if item.beer.isEqual(beer: beer) {
            return true
        }
    }
    
    return false
}

func getLikedBeers() -> [Beer] {
    var toReturn = [Beer]()
    for beer in allBeers {
        if beer.liked {
            toReturn.append(beer.beer)
        }
    }
    return toReturn
}
