//
//  MobileNetwork.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class MobileNetwork: Network {
    private let logger: Logger?

    init(logger: Logger?) {
        self.logger = logger
    }
    
    func get(url: String, parameters: [String: Any]?) async -> Data? {
        logger?.debug(text: "url: \(url), parameters: \(String(describing: parameters))")
        return await performRequest(method: "GET", url: url, parameters: parameters)
    }

    func post(url: String, parameters: [String: Any]?) async -> Data? {
        logger?.info(text: "url: \(url), parameters: \(String(describing: parameters))")
        return await performRequest(method: "POST", url: url, parameters: parameters)
    }

    func put(url: String, parameters: [String: Any]?) async -> Data? {
        logger?.warn(text: "url: \(url), parameters: \(String(describing: parameters))")
        return await performRequest(method: "PUT", url: url, parameters: parameters)
    }

    func patch(url: String, parameters: [String: Any]?) async -> Data? {
        logger?.warn(text: "url: \(url), parameters: \(String(describing: parameters))")
        return await performRequest(method: "PATCH", url: url, parameters: parameters)
    }

    func delete(url: String, parameters: [String: Any]?) async -> Data? {
        logger?.error(text: "url: \(url), parameters: \(String(describing: parameters))")
        return await performRequest(method: "DELETE", url: url, parameters: parameters)
    }

    // Simulates an async network request
    private func performRequest(method: String, url: String, parameters: [String: Any]?) async -> Data? {
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { // Simulate network delay
                let response = "\(method): \(url), \(String(describing: parameters))".data(using: .utf8)
                continuation.resume(returning: response)
            }
        }
    }
}

