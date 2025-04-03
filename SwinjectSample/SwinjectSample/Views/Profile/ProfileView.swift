//
//  ProfileView.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel = ProfileConfigurator.configure()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                List {
                    Text(viewModel.text)
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
    ProfileView()
}
