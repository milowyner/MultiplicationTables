//
//  SettingsView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/23/21.
//

import SwiftUI

struct SettingsView: View {
    @State var tableIndex = 5
    @State var selectedNumberOfQuestions = 0
    @Binding var gameIsActive: Bool
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Choose a multiplication table", selection: $tableIndex) {
                    ForEach(1..<13) {
                        Text("\($0)")
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Number of questions:")
                        Picker("Number of questions", selection: $selectedNumberOfQuestions) {
                            ForEach(0..<numberOfQuestions.count) {
                                Text(numberOfQuestions[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section {
                    Button("Start Game") {
                        withAnimation {
                            gameIsActive = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Multiplication Tables")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameIsActive: .constant(false))
    }
}
