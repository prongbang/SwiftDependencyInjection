//
//  SettingsView.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingViewModel
    
    init(viewModel: SettingViewModel = SettingConfigurator.configure()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                List {
                    Text(viewModel.home)
                    Text(viewModel.profile)
                }
            }
        }
        .viewLifecycle(
            onViewDidLoad: {
                viewModel.fetchData()
            }
        )
    }
}

#Preview {
    SettingsView()
}
