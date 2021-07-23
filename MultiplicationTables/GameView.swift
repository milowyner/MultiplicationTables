//
//  GameView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/23/21.
//

import SwiftUI

struct GameView: View {
    let table: Int
    let selectedNumberOfQuestions: Int
    @Binding var isActive: Bool
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello game!")
                Text("\(table) multiplication table")
                Text("\(numberOfQuestions[selectedNumberOfQuestions]) questions")
                Button("End Game") {
                    withAnimation {
                        isActive = false
                    }
                }
            }
            .navigationTitle("Multiplication Tables")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 3, selectedNumberOfQuestions: 10, isActive: .constant(true))
    }
}
