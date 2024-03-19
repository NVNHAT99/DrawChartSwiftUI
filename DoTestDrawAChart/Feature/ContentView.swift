//
//  ContentView.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            VStack {
                NavigationLink(destination: ChartScreen( viewModel: ChartScreenViewModel())) { Text("Move to chart Screen") }
            }
            .padding()
        })
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ContentView()
}
