//
//  ListUpService.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation
import Alamofire


protocol ListUpService: Service {
    func getUpMovies(completion: @escaping(_ response: ListUpCellResponse?, _ error: Error?) -> Void )
    
}


final class ListUpServiceImpl: ListUpService{
    
    private struct EndPoints{
        static let pathTop = "movie/upcoming?api_key=56875e2da8379b78e6d77685dcf33d84&language=en-US&page=1"
    }
    
    func getUpMovies(completion: @escaping (ListUpCellResponse?, Error?) -> Void) {
        
        Alamofire.request(String(format: "%@%@", baseURL, EndPoints.pathTop), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:header).responseJSON{ [weak self] response in
            switch response.result{
            case .success:
                guard let json = response.result.value else{
                    return completion(nil, ApiError.dataError)
                }
                print(json)
                var j = json as! [String:Any]
                var jsonMovies = j["results"] as! [[String:Any]]
                let listUpMovies = self?.builder.build(fromClass: ListUpCellResponse.self, from: jsonMovies as? [[String:Any]])
                completion(listUpMovies,nil)
            case .failure:
                completion(nil, ApiError.serverError)
            }
        }
    }
    
    
}

