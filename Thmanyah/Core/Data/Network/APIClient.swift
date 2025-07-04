//
//  APIClientProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T
    func request<T: Decodable, U: Encodable>(
        _ endpoint: Endpoint,
        body: U,
        responseType: T.Type
    ) async throws -> T
}

final class APIClient: APIClientProtocol {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
        let request = try RequestBuilder.buildRequest(from: endpoint)
        return try await performRequest(request, responseType: responseType)
    }
    
    func request<T: Decodable, U: Encodable>(
        _ endpoint: Endpoint,
        body: U,
        responseType: T.Type
    ) async throws -> T {
        let request = try RequestBuilder.buildRequest(from: endpoint, body: body)
        return try await performRequest(request, responseType: responseType)
    }
    
    private func performRequest<T: Decodable>(
        _ request: URLRequest,
        responseType: T.Type
    ) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard 200...299 ~= httpResponse.statusCode else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            do {
                return try decoder.decode(responseType, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }
            
        } catch let error as NetworkError {
            throw error
        } catch let urlError as URLError {
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost:
                throw NetworkError.networkUnavailable
            case .timedOut:
                throw NetworkError.timeout
            default:
                throw NetworkError.unknown(urlError)
            }
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}