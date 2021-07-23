//
//  GameView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/23/21.
//

import SwiftUI

struct GameView: View {
    let table: Int
    let numberOfQuestions: NumberOfQuestions
    @Binding var isActive: Bool
        
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello game!")
                Text("\(table) multiplication table")
                Text("\(numberOfQuestions.rawValue) questions")
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
        GameView(table: 3, numberOfQuestions: .five, isActive: .constant(true))
    }
}
