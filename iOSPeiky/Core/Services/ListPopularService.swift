//
//  ListPopularService.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation
import Alamofire

protocol ListPopularService: Service {
    func getPopularMovies(completion: @escaping(_ response: ListPopularCellResponse?, _ error: Error?) -> Void )
    
}


final class ListPopularServiceImpl: ListPopularService{
    
    private struct EndPoints{
        static let pathPopular = "movie/popular?api_key=56875e2da8379b78e6d77685dcf33d84"
    }
    
    func getPopularMovies(completion: @escaping (ListPopularCellResponse?, Error?) -> Void) {
        
        Alamofire.request(String(format: "%@%@", baseURL, EndPoints.pathPopular), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:header).responseJSON{ [weak self] response in
            switch response.result{
            case .success:
                guard let json = response.result.value else{
                    return completion(nil, ApiError.dataError)
                }
                print(json)
                var j = json as! [String:Any]
                var jsonMovies = j["results"] as! [[String:Any]]
                let listPopularMovies = self?.builder.build(fromClass: ListPopularCellResponse.self, from: jsonMovies as? [[String:Any]])
                completion(listPopularMovies,nil)
            case .failure:
                completion(nil, ApiError.serverError)
            }
        }
    }
    
    
}
