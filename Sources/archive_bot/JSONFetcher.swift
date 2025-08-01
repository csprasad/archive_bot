//
//  JSONFetcher.swift
//  archive_bot
//
//  Fetches the content.json file from the dkhamsing/open-source-ios-apps repository.
//  Returns parsed JSON as Swift-native types for further processing.
//


import Foundation

enum JSONFetcher {
    static let jsonURL = URL(string: "https://raw.githubusercontent.com/dkhamsing/open-source-ios-apps/master/contents.json")!

    static func fetch() async throws -> [String: Any] {
        let (data, response) = try await URLSession.shared.data(from: jsonURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let dict = json as? [String: Any] else {
            throw NSError(domain: "Invalid JSON structure", code: 1)
        }
        
        return dict
    }
}
