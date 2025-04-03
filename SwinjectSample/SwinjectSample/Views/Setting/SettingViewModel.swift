//
//  SettingViewModel.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import SwiftUI
import Combine

class SettingViewModel: ObservableObject {
    private let network: Network?
    private let cacheManager: CacheManager?
    
    @Published var home: String = ""
    @Published var profile: String = ""
    
    init(network: Network?, cacheManager: CacheManager?) {
        self.network = network
        self.cacheManager = cacheManager
    }
    
    func fetchData() {
        Task { [weak self] in
            guard let self = self else { return }
            
            async let homeData: String? = fetchCachedOrRemoteData(
                key: "home",
                url: "http://localhost/home",
                parameters: ["message": "home"]
            )
            
            async let profileData: String? = fetchCachedOrRemoteData(
                key: "profile",
                url: "http://localhost/profile",
                parameters: ["message": "profile"]
            )
            
            let (home, profile) = await (homeData, profileData)
            
            await MainActor.run {
                if let home = home { self.home = home }
                if let profile = profile { self.profile = profile }
            }
        }
    }
    
    private func fetchCachedOrRemoteData(key: String, url: String, parameters: [String: Any]) async -> String? {
        if let cachedData = cacheManager?.get(key: key) as? String {
            return cachedData
        } else if let data = await network?.get(url: url, parameters: parameters),
                  let text = String(data: data, encoding: .utf8) {
            cacheManager?.set(key: key, text)
            return text
        }
        return nil
    }
}
