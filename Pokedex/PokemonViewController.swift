//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Diana Oros on 6/13/20.
//  Copyright © 2020 Diana Oros. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var typeOneLabel: UILabel!
    @IBOutlet var typeTwoLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOneLabel.text = ""
        typeTwoLabel.text = ""
        
        performRequest()
    }
    
    
    func performRequest() {
        let url = URL(string: pokemon.url)
        guard let sessionURL = url else {
            return
            
        }
        
        URLSession.shared.dataTask(with: sessionURL) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                
                DispatchQueue.main.async {
                    self.nameLabel.text = self.pokemon.name
                    self.numberLabel.text = String(format: "#%03d", pokemonData.id)
                    for typeEntry in pokemonData.types {
                        if typeEntry.slot == 1 {
                            self.typeOneLabel.text = typeEntry.type.name
                        } else {
                            self.typeTwoLabel.text = typeEntry.type.name
                        }
                    }
                }
            }
            catch let error {
                print("\(error)")
            }
            
            
            
        }.resume()
    }
}
