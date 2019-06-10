//
//  Builder.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation

class Builder{
    func build<T>(fromClass classType: T.Type, from list: [[String: Any]]?) -> T? {
        guard
            let list = list,
            let builder = builder(forClassName: String(describing: classType)) as? ObjectBuilder
            else { return nil }
        
        return builder.build(from: list)
    }
    
    
    private func builder(forClassName className:String) -> Any?{
        switch className{
        case String(describing: ListPopularCellResponse.self):
            return ListPopularBuilder(builder: self)
            break
        case String(describing: ListTopCellResponse.self):
            return ListTopBuilder(builder: self)
        case String(describing: ListUpCellResponse.self):
            return ListUpBuilder(builder: self)
        default:
            return nil
        }
    }
    
}
