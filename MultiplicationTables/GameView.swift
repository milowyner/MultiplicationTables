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
    @State private var questionNumber = 1
    @State private var numbersInTable = [Int]()
    
    private var numberInTable: Int {
        let index: Int
        if numberOfQuestions.number != nil {
            index = (questionNumber - 1) % table
        } else {
            index = questionNumber - 1
        }
        return numbersInTable.isEmpty ? 0 : numbersInTable[index]
    }
    
    private var question: String {
        "\(numberInTable) x \(table)"
    }
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    func checkAnswer() {
        guard let answer = Int(answer) else { return }
        let correctAnswer = numberInTable * table
        
        if answer == correctAnswer {
            alertTitle = "Correct!"
        } else {
            alertTitle = "Incorrect!"
        }
        alertMessage = "\(question) = \(correctAnswer)"

        showingAlert = true
    }
    
    func nextQuestion() {
        if questionNumber == (numberOfQuestions.number ?? table) {
            withAnimation {
                isActive = false
            }
        } else {
            answer = ""
            questionNumber += 1
            if (questionNumber - 1) % table == 0 {
                numbersInTable.shuffle()
            }
        }
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
            numbersInTable = Array(1...table).shuffled()
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Next"), action: nextQuestion))
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 10, numberOfQuestions: .five, isActive: .constant(true))
    }
}
