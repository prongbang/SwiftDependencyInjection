//
//  ConsoleLogger.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class ConsoleLogger: Logger {
    func debug(text: String) {
        print("[DEBUG] \(text)")
    }
    
    func info(text: String) {
        print("[INFO] \(text)")
    }
    
    func warn(text: String) {
        print("[WARN] \(text)")
    }
    
    func error(text: String) {
        print("[ERROR] \(text)")
    }
}
