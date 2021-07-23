//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/22/21.
//

import SwiftUI

enum NumberOfQuestions: String, CaseIterable, Identifiable {
    case five = "5"
    case ten = "10"
    case twenty = "20"
    case all = "All"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State var tableIndex = 5
    @State var numberOfQuestions = NumberOfQuestions.five
    @State var gameIsActive = false
    
    var body: some View {
        Group {
            if gameIsActive {
                GameView(table: tableIndex + 1, numberOfQuestions: numberOfQuestions, isActive: $gameIsActive)
            } else {
                SettingsView(tableIndex: $tableIndex, numberOfQuestions: $numberOfQuestions, gameIsActive: $gameIsActive)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
