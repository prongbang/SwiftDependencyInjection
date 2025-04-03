//
//  CacheManager.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

protocol CacheManager {
    func get(key: String) -> Any?
    func set(key: String, _ value: Any)
}
