//
//  HomeView.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = HomeConfigurator.configure()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home Screen")
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
    HomeView()
}
