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
    
    // The list of previous results
    
    @State var previousResults: [Result] = [] // empty array
    
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            // Left Side
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
                HStack {
                    
                    Button {
                        newWord()
                    } label: {
                        Text("New Word")
                    }
                    
                    
                    Button {
                        checkGuess()
                    } label : {
                        Text("Submit")
                    }
                }
                
            }
            
            // Right Side
            
            List(previousResults) { curentResult in
              
                HStack {
                    Image(curentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text(curentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(curentResult.outcome.rawValue)
                }
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
        
        // Save prior result
        previousResults.insert(
            Result(
                item: currentItem,
                guessProvided: guess,
                outcome: currentOutcome
            ),
            at: 0
        )
        // DEBUG: What is in the array
        print(previousResults)
    }
    
    func newWord() {
        currentItem = itemsToSpell.randomElement()!
        guess = ""
        currentOutcome = .undetermined
    }
}

#Preview {
    QuizView()
}
