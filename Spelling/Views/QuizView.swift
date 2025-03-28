//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    
    // Random food user needs to guess
    @State var currentItem = itemsToSpell.randomElement()!
    
    // Guess text inputed by the user
    @State var guess: String = ""
    
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            TextField("Guess the food", text: $guess)
                .padding()
                .frame(width: 300, height: 50)
            
            Button {
                checkGuess()
            } label : {
                Text("Submit")
            }
            
        }
        
    }
    
    //MARK: Functions
    func checkGuess() {
        if guess == currentItem.word {
            print("correct")
        } else {
            print("incorrect")
        }
    }
}

#Preview {
    QuizView()
}
