//
//  BaseAPIFetcher.swift
//  DoTestDrawAChart
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

protocol APIFetcherProtocol {

}

class BaseAPIFetcher: APIFetcherProtocol {
    
    func decodeData<T: Decodable>(_ data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
            let response: T = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            throw APIError.decodeFailed
        }
    }
}
