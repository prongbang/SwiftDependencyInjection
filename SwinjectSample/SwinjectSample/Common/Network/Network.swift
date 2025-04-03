//
//  Network.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

protocol Network {
    func get(url: String, parameters: [String: Any]?) async -> Data?
    func post(url: String, parameters: [String: Any]?) async -> Data?
    func put(url: String, parameters: [String: Any]?) async -> Data?
    func patch(url: String, parameters: [String: Any]?) async -> Data?
    func delete(url: String, parameters: [String: Any]?) async -> Data?
}
