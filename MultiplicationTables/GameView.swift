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
    @State private var answer: String = ""
        
    var body: some View {
        VStack {
            Spacer()
            
            Text("What is")
                .font(.title)
            Text("3 x 5")
                .font(.system(size: 40).bold())
                .padding(.bottom, 16)
            
            TextField("Answer", text: $answer, onCommit:  {
                // check answer
            })
            .frame(width: 130)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .font(.title)
            
            Spacer()
            Button("End Game") {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 3, numberOfQuestions: .five, isActive: .constant(true))
    }
}
