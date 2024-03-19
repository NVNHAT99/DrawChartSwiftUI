//
//  ColumChartView.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import SwiftUI

struct ColumChartView: View {
    @State var data: DailyUsageHistory?
    @State var maxValue: Float = 0
    var body: some View {
        VStack(spacing: 41, content: {
            Spacer()
            ZStack(content: {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 24,
                           height: data?.heightOfColumn(maxValue),
                           alignment: .bottom)
            })// ZStack
            
            VStack(spacing: 4, content: {
                Text("\(data?.date?.toDate("dd") ?? "")")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.65))
                
                Text("\(data?.date?.toDate("MMM") ?? "")")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.65))
            })// VStack
        })
        .padding(.bottom, 16)
    }
}

#Preview {
    ColumChartView()
}
