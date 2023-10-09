//
//  APIClient.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 26/09/23.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    
    private init() { }
    
    func makeRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
