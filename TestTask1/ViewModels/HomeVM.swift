//
//  HomeVM.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import Foundation

class HomeVM {
    private let networkService = NetworkService()
    private let alcoholUrl = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    
    func getAlcohol(completion: @escaping ([AlcoholModel])->()) {
        networkService.getAlcohol(url: alcoholUrl) { string in
            guard let string = string else {
                return
            }
            
            guard let data = string.data(using: .utf8) else { return }
            let alcoholResponse = try! JSONDecoder().decode(AlcoholResponse.self, from: data)
            completion(alcoholResponse.drinks)
        }
        
    }
    
}


