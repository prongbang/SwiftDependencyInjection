//
//  ProfileViewModel.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    private let network: Network?
    
    @Published var text: String = ""
    
    init(network: Network?) {
        self.network = network
    }
    
    func fetchData() {
        guard let network = network else { return }
        
        Task { [weak self] in
            guard let self = self else { return }
            
            if let data = await network.get(url: "http://localhost/profile", parameters: ["message": "profile"]),
               let text = String(data: data, encoding: .utf8) {
                await MainActor.run {
                    self.text = text
                }
            }
        }
    }
}
