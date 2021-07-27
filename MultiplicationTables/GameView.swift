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
    
    @State private var answer = ""
    @State private var numberInTable = ""
    
    private var question: String {
        "\(numberInTable) x \(table)"
    }
    
    @State private var questionNumber = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    private func randomNumberInTable() -> String {
        "\(Int.random(in: 1...table))"
    }
    
    func checkAnswer() {
        guard let numberInTable = Int(numberInTable),
              let answer = Int(answer) else { return }
        let correctAnswer = numberInTable * table
        
        if answer == correctAnswer {
            alertTitle = "Correct!"
        } else {
            alertTitle = "Incorrect!"
        }
        alertMessage = "\(question) = \(correctAnswer)"

        showingAlert = true
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("What is")
                .font(.title)
            Text(question)
                .font(.system(size: 40).bold())
                .padding(.bottom, 16)
            
            TextField("Answer", text: $answer, onCommit:  {
                checkAnswer()
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
        .onAppear(perform: {
            numberInTable = randomNumberInTable()
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Next"), action: {
                if questionNumber == (numberOfQuestions.number ?? table) {
                    withAnimation {
                        isActive = false
                    }
                } else {
                    numberInTable = randomNumberInTable()
                    answer = ""
                    questionNumber += 1
                }
            }))
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 10, numberOfQuestions: .five, isActive: .constant(true))
    }
}
