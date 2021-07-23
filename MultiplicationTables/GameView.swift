//
//  GameView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/23/21.
//

import SwiftUI

struct GameView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello game!")
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
        GameView(isActive: .constant(true))
    }
}
