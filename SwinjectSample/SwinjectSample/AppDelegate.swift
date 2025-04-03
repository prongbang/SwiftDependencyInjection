//
//  AppDelegate.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Support modular
        // AppAssembler.registerDependencies()
        
        // Unsupport modular
        AppContainer.registerDependencies()
        return true
    }
}
