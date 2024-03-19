//
//  ChartScreen.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 19/03/2024.
//

import SwiftUI

struct ChartScreen: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    // Using State Object because if using ObservedObject make data reset to default when view reload
    @StateObject var viewModel: ChartScreenViewModel = ChartScreenViewModel()
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .tint(.black.opacity(0.7))
                })
                Spacer()
            }) // HStack
            .padding(.leading, 12)
            HStack(alignment: .center, content: {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("Usage")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }) // HStack
            .padding(.leading, 12)
            .padding(.top, 16)
            Divider()
                .frame(minHeight: 2)
                .overlay(.gray.opacity(0.4))
                .padding(.horizontal, 16)
            HStack(content: {
                Text(viewModel.state.dataChart?.address ?? "")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.6))
                Spacer()
            }) // HStack
            .padding(.leading, 16)
            ScrollView {
                DailyUseView(data: viewModel.dataChart())
                    .padding()
                    .clipShape(.rect(cornerRadius: 60))
                ControllerLoadUsageView(data: viewModel.dataChart())
                    .padding()
                    .clipShape(.rect(cornerRadius: 60))
                Spacer()
            } // ScrollView
        }) // VStack
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity)
        .padding(.top, 12)
        .background(.gray.opacity(0.25))
        .task {
            viewModel.send(intent: .fetchData)
        }
        
    }
}

#Preview {
    ChartScreen(viewModel: ChartScreenViewModel())
}
