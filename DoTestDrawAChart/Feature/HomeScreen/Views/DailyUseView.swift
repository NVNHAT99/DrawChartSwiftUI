//
//  DailyUseView.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import SwiftUI

struct DailyUseView: View {
    // MARK: - Properties
    @Binding var data: EnergyUsageHistory?
    @State var indexSelected: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, content: {
            VStack(spacing: 8, content: {
                Text("Daily usage")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(data?.from?.toDate() ?? "") - \(data?.to?.toDate() ?? "")")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundStyle(.black.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack(content: {
                    VStack(content: {
                        Spacer()
                        ZStack(alignment: .bottom,content: {
                            Divider()
                                .frame(minHeight: 2)
                                .overlay(.black.opacity(0.2))
                        })
                    })
                    .padding(.bottom, 70)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: Array(repeating: GridItem(.fixed(50), spacing: 16), count: 1), spacing: 16) {
                            ForEach((data?.usageHistories ?? []), id: \.self) { item in
                                ColumChartView(data: item,
                                               maxValue: data?.maxEnergyDailyUse ?? 0)
                                    .frame(height: 250)
                            }
                        }
                    }
                }) // ZStack
                .frame(height: 250)
                
                VStack(spacing: 8, content: {
                    HStack(content: {
                        Text("Avg daily usage")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black.opacity(0.65))
                        Spacer()
                        Text("$\((data?.avgDailyUsage ?? 0).extractTwoDecimalDigitsStr())")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }) // HStack
                    HStack(content: {
                        Text("Avg daily consumption")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black.opacity(0.65))
                        Spacer()
                        Text("\((data?.avgDailyConsumption ?? 0).extractTwoDecimalDigitsStr()) kWh")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }) // HStack
                })// Vstack
            }) // VStack
            Spacer()
        }) // VStack
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.white)

        
    }
}

#Preview {
    DailyUseView(data: .constant(.init(address: "",
                                       from: "",
                                       to: "",
                                       usageHistories: [],
                                       approxTotalCost: nil,
                                       approxTotalElectricity: nil,
                                       currentTotalCost: nil,
                                       currentTotalElectricity: nil)))
}
