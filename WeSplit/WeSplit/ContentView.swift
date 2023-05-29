//
//  ContentView.swift
//  WeSplit
//
//  Created by Aarav Nair on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var inFocus: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let totalPercent = Double(tipPercentage)/100 + 1
        
        let total = checkAmount * totalPercent / peopleCount
        return total
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($inFocus)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Tip Percentage")
                    }
                    
                    Section {
                        Text(totalPerPerson * Double(numberOfPeople + 2), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(tipPercentage==0 ? .red : .primary)
                    } header: {
                        Text("Total Amount")
                    }
                    
                    Section {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(tipPercentage==0 ? .red : .primary)
                    } header: {
                        Text("Amount per Person")
                    }
                }
                .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            inFocus = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
