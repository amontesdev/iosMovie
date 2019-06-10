//
//  ObjectBuilder.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation

protocol ObjectBuilder{
    var builder: Builder? { get }
    func build<T>(from dictionary: [[String: Any]]?) -> T?
}
