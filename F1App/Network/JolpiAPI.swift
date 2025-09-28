//
//  JolpiAPI.swift
//  F1App
//
//  Created by Bruno Radić on 28.09.2025..
//

import Foundation



func buildJolpiURL(offset: Int = 0, limit: Int = 30) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.jolpi.ca"
    components.path = "/ergast/f1/2025/results/"
    
    components.queryItems = [
        URLQueryItem(name: "limit", value: "\(limit)"),
        URLQueryItem(name: "offset", value: "\(offset)")
    ]
    
    return components.url
}


func fetchRaceData(_ offset: Int = 0) async throws -> JolpiResponse {
   
    guard let url = buildJolpiURL(offset: offset) else {
       throw MRError.InvalidURL
    }
   
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw MRError.InvalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        let response = try decoder.decode(JolpiResponse.self, from: data)
        return response
    } catch {
        throw MRError.DecodingError
    }
    
    
    
}
