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
    
    @State private var correctQuestions = 0
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
    @State private var alertDismiss = "Next"
    @State private var showingAlert = false
    @State private var gameOver = false
    
    func checkAnswer() {
        guard let answer = Int(answer) else { return }
        let correctAnswer = numberInTable * table
        
        if answer == correctAnswer {
            alertTitle = "Correct!"
            correctQuestions += 1
        } else {
            alertTitle = "Incorrect!"
        }
        alertMessage = "\(question) = \(correctAnswer)"

        showingAlert = true
    }
    
    func nextQuestion() {
        // if no more questions
        if questionNumber == (numberOfQuestions.number ?? table) {
            gameOver = true
            alertTitle = "Game over!"
            alertMessage = "You got \(correctQuestions) questions right out of \(numberOfQuestions.number ?? table)"
            alertDismiss = "Back to Menu"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                showingAlert = true
            }
        } else {
            answer = ""
            questionNumber += 1
            if (questionNumber - 1) % table == 0 {
                numbersInTable.shuffle()
            }
        }
    }
    
    func endGame() {
        withAnimation {
            isActive = false
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            isActive = false
                        }
                    }, label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    })
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("Question \(questionNumber) of \(numberOfQuestions.number ?? table)")
                    .padding()
            }
            
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
            .keyboardType(.numbersAndPunctuation)
            .multilineTextAlignment(.center)
            .font(.title)
            
            Spacer()
        }
        .onAppear(perform: {
            numbersInTable = Array(1...table).shuffled()
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(alertDismiss), action: gameOver ? endGame : nextQuestion))
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 10, numberOfQuestions: .five, isActive: .constant(true))
    }
}
