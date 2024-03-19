//
//  ChartScreenViewModel.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 19/03/2024.
//

import Foundation
import SwiftUI

final class ChartScreenViewModel: ObservableObject {
    @Published private(set) var state: ChartScreenState
    
    private let apiFetcher: HomeEnergyUsageAPIFetcherProtocol
    
    init(state: ChartScreenState = .init(dataChart: nil),
         apiFetcher: HomeEnergyUsageAPIFetcherProtocol = HomeEnergyUsageAPIFetcher()) {
        self.state = state
        self.apiFetcher = apiFetcher
    }
}

// MARK: - Handle logic of screen and action here
extension ChartScreenViewModel {
    func send(intent: ChartScreenIntent) {
        switch intent {
        case .fetchData:
            fetchData()
        }
    }
    
    private func fetchData() {
        // TODO: - need show loading
        Task {
            do {
                let responseAPI = try await apiFetcher.fetchData(type: EnergyUsageHistory.self)
                await MainActor.run { [weak self] in
                    guard let self = self else {
                        return
                    }
                    // TODO: - need hide loading
                    var tempState = self.state
                    tempState.dataChart = responseAPI
                    self.state = tempState
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - binding data
extension ChartScreenViewModel {
    func dataChart() -> Binding<EnergyUsageHistory?> {
        return Binding<EnergyUsageHistory?>(
            get: { self.state.dataChart },
            set: { _ in
            }
        )
    }
}
