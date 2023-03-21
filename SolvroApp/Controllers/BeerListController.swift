//
//  BeerListController.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import Foundation

var likedBeersIDs = loadLikedBeersFromDisk()

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

func getLikedBeers() async -> [Beer] {
    var toReturn = [Beer]()
    let allBeers = await loadBeersFromAPI()
    for beer in allBeers ?? [Beer]() {
        if likedBeersIDs.contains(beer.id) {
            toReturn.append(beer)
        }
    }
    return toReturn
}

func loadLikedBeersFromDisk() -> [Int] {
    var likedBeers = [Int]()
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let filePath = path.appending(path: "likedBeerIDs.txt")
    
    do {
        let ids = try String(contentsOf: filePath, encoding: .utf8)
        let splittedIDs = ids.split(separator: ";")
        for id in splittedIDs {
            likedBeers.append(Int(id) ?? 0)
        }
    } catch {
        print(error.localizedDescription)
    }
    return likedBeers
}

func saveLikedBeersToDisk() {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let filePath = path.appending(path: "likedBeerIDs.txt")
    
    do {
        try prepareIDsToWrite().write(to: filePath, atomically: true, encoding: .utf8)
    } catch {
        print(error.localizedDescription)
    }
    
}

func prepareIDsToWrite() -> String {
    var preparedString = ""
    for id in likedBeersIDs {
        preparedString += "\(id);"
    }
    return preparedString
}
