//
//  ContentView.swift
//  UnitConverter
//
//  Created by Aarav Nair on 3/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var inUnit = "Celcius"
    let units = ["Celcius", "Fahrenheit", "Kelvin"]
    @State private var outUnit = "Fahrenheit"
    
    func toCelcius() -> Double {
        if (inUnit == "Celcius") {
            return input;
        }
        if (inUnit == "Fahrenheit") {
            return (input - 32) * 5/9
        }
        else {
            return (input - 273.15)
        }
    }
    
    func fromCelcius() -> Double {
        if(outUnit == "Celcius") {
            return toCelcius();
        }
        if (outUnit == "Fahrenheit") {
            return (toCelcius() * 9/5) + 32;
        }
        else {
            return toCelcius() + 273.15
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Enter Value", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Unit of Input", selection: $inUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                    }
                }
            } header: {
                Text("Input Value")
            }
            
            Section {
                Picker("Unit of Out", selection: $outUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                    }
                }
            }
            
            Section {
                Text(fromCelcius(), format: .number)
            } header: {
                Text("Converted Value")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
