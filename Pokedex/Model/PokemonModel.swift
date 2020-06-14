//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Diana Oros on 6/13/20.
//  Copyright © 2020 Diana Oros. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonList: Codable {
    let results: [Pokemon]
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}
struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}
struct PokemonType: Codable {
    let name: String
    let url: String
}


