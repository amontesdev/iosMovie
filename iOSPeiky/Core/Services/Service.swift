//
//  Service.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation
import Alamofire

enum ApiError: Error {
    case dataError
    case serverError
}

extension ApiError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .dataError:
            return NSLocalizedString("there is an error with the implementation of the service", comment: "frontend Error")
            
        case .serverError:
            return NSLocalizedString("there is an error from back", comment: "BackendError")
            
        }
    }
}
protocol Service {
    
    var builder: Builder { get }
    var baseURL: String { get }
    var header: HTTPHeaders { get }
}

extension Service {
    var builder: Builder {
        return Builder()
    }
    
    var baseURL: String {
        return ApiBaseUrl.movies
    }
    
    var header: HTTPHeaders { return ["Content-Type": "application/json"] }
}

