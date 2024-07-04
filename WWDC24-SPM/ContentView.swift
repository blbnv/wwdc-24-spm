//
//  ContentView.swift
//  WWDC24-SPM
//
//  Created by Oleksandr Balabanov on 31/05/2024.
//

import SwiftUI
import Module1

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Foo.test()
        }
    }
}

#Preview {
    ContentView()
}
