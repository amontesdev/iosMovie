//
//  ServiceLocator.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation

protocol ServiceLocatorDelegate{
    func get<T>(service: T.Type) -> T?
    
}

final class ServiceLocator: ServiceLocatorDelegate{
    
    static let sharedInstance = ServiceLocator()
    
    func get<T>(service: T.Type) -> T? {
        switch String(describing: service) {
        case String(describing: ListPopularService.self):
            return ListPopularServiceImpl() as? T
        case String(describing: ListTopService.self):
            return ListTopServiceImpl() as? T
        case String(describing: ListUpService.self):
            return ListUpServiceImpl()as? T
        default:
            return nil
        }
    }
    
    
}
