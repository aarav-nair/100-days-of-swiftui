//
//  ContentView.swift
//  Project3
//
//  Created by Aarav Nair on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
            
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
        .padding()
        
        Button("Hello World") {
                    // flip the Boolean between true and false
                    useRedText.toggle()
                }
                .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
