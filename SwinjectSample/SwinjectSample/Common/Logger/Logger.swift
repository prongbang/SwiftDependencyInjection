//
//  Logger.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

enum LoggerNamed: String {
    case console = "ConsoleLogger"
}

protocol Logger {
    func debug(text: String)
    func info(text: String)
    func warn(text: String)
    func error(text: String)
}
