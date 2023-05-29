//
//  ContentView.swift
//  Project3
//
//  Created by Aarav Nair on 5/29/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func TitleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Text("Hello World")
            .TitleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
