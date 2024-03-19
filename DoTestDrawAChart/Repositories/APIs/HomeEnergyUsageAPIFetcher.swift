//
//  HomeEnergyUsageAPIFetcher.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

protocol HomeEnergyUsageAPIFetcherProtocol: AnyObject {
    func fetchData<T: Codable>(type: T.Type) async throws -> T
}

final class HomeEnergyUsageAPIFetcher: BaseAPIFetcher {
    
}

extension HomeEnergyUsageAPIFetcher: HomeEnergyUsageAPIFetcherProtocol {
    func fetchData<T: Codable>(type: T.Type) async throws -> T {
        guard let url = Bundle.main.url(forResource: "mock_data", withExtension: "json") else {
            throw APIError.other
        }
        
        do {
            let data = try Data(contentsOf: url)
            let responseEntity = try decodeData(data, type: type)
            return responseEntity
        } catch {
            throw APIError.decodeFailed
        }
    }
}
