//
//  ContentView.swift
//  SampleViewer
//
//  Created by S-Shimotori on 2024/10/13.
//

import SwiftUI
import SampleLibrary

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(message)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
