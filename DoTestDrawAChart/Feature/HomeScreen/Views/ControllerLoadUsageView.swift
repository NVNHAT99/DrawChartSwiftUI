//
//  ControllerLoadUsageView.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import SwiftUI

struct ControllerLoadUsageView: View {
    @Binding var data: EnergyUsageHistory?
    var body: some View {
        VStack(content: {
            Text("Controller load usage")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .frame(minHeight: 2)
                .overlay(.black.opacity(0.2))
            Spacer()
                .frame(height: 24)
            VStack(spacing: 8, content: {
                HStack(content: {
                    Text("Approx total cost")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black.opacity(0.65))
                    Spacer()
                    Text("$\((data?.totalCost ?? 0).extractTwoDecimalDigitsStr())")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }) // HStack
                HStack(content: {
                    Text("Approx total electricity")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black.opacity(0.65))
                    Spacer()
                    Text("\((data?.totalConsumption ?? 0)) kWh")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }) // HStack
            })// Vstack
        })
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.white)

    }
}

#Preview {
    ControllerLoadUsageView(data: .constant(.init(address: "",
                                            from: "",
                                            to: "",
                                            usageHistories: [],
                                            approxTotalCost: nil,
                                            approxTotalElectricity: nil,
                                            currentTotalCost: nil,
                                            currentTotalElectricity: nil)))
}
