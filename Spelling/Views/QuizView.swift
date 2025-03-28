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
    
    // What was the outcome of the guess
    
    @State var currentOutcome: Outcome = .undetermined
    
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            ZStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                
                Text(currentOutcome.rawValue)
                    .font(.system(size: 100))
            }
            
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
            currentOutcome = .correct
            print("correct")
        } else {
            currentOutcome = .incorrect
            print("incorrect")
        }
    }
}

#Preview {
    QuizView()
}
