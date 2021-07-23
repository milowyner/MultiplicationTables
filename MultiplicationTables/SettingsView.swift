//
//  SettingsView.swift
//  MultiplicationTables
//
//  Created by Milo Wyner on 7/23/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var tableIndex: Int
    @Binding var numberOfQuestions: NumberOfQuestions
    @Binding var gameIsActive: Bool
    
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
                        Picker("Number of questions", selection: $numberOfQuestions) {
                            ForEach(NumberOfQuestions.allCases) {
                                Text($0.rawValue).tag($0)
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
        SettingsView(tableIndex: .constant(5), numberOfQuestions: .constant(.five), gameIsActive: .constant(false))
    }
}
