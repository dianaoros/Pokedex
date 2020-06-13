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
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
        numberLabel.text = String(format: "#%03d", pokemon.number)
        
    }
}
