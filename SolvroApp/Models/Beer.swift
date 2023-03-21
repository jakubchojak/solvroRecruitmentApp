//
//  Beer.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import Foundation

struct Beer: Codable, Identifiable {
    let id: Int
    let name: String
    let tagline: String
    let first_brewed: String
    let description: String
    let image_url: String
    
    func isEqual(beer: Beer) -> Bool{
        if (self.id == beer.id) && (self.name == beer.name) {
            return true
        }
        return false
    }
}
