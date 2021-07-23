//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    @State var gameIsActive = false
    
    var body: some View {
        Group {
            if gameIsActive {
                GameView(isActive: $gameIsActive)
            } else {
                SettingsView(gameIsActive: $gameIsActive)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
