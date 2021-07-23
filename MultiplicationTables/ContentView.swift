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
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Multiplication Tables")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}