//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    @State var tableIndex = 5
    @State var selectedNumberOfQuestions = 0
    @State var gameIsActive = false
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    var body: some View {
        Group {
            if gameIsActive {
                GameView(table: tableIndex + 1, selectedNumberOfQuestions: selectedNumberOfQuestions, isActive: $gameIsActive)
            } else {
                SettingsView(tableIndex: $tableIndex, selectedNumberOfQuestions: $selectedNumberOfQuestions, gameIsActive: $gameIsActive)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
