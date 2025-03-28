//
//  Result.swift
//  Spelling
//
//  Created by Benjamin Lavallee on 2025-03-28.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    
    // The item the user was supposed to guess
    let item: Item
    
    // What the user actually guessed
    let guessProvided: String
    
    // Whether it was correct or not
    let outcome: Outcome
    
}
