//
//  ListTopServices.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation
import Alamofire


protocol ListTopService: Service {
    func getTopMovies(completion: @escaping(_ response: ListTopCellResponse?, _ error: Error?) -> Void )
    
}


final class ListTopServiceImpl: ListTopService{
    
    private struct EndPoints{
        static let pathTop = "movie/top_rated?api_key=56875e2da8379b78e6d77685dcf33d84&language=en-US&page=1"
    }
    
    func getTopMovies(completion: @escaping (ListTopCellResponse?, Error?) -> Void) {
        
        Alamofire.request(String(format: "%@%@", baseURL, EndPoints.pathTop), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:header).responseJSON{ [weak self] response in
            switch response.result{
            case .success:
                guard let json = response.result.value else{
                    return completion(nil, ApiError.dataError)
                }
                print(json)
                var j = json as! [String:Any]
                var jsonMovies = j["results"] as! [[String:Any]]
                let listTopMovies = self?.builder.build(fromClass: ListTopCellResponse.self, from: jsonMovies as? [[String:Any]])
                completion(listTopMovies,nil)
            case .failure:
                completion(nil, ApiError.serverError)
            }
        }
    }
    
    
}
