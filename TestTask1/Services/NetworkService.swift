//
//  NetworkService.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import Foundation
import Alamofire

class NetworkService {
    
    func getAlcohol(url: String, completion: @escaping (String?)->()) {
        AF.download(url).responseString { responseString in
            completion(responseString.value)
        }
    }
    
}
