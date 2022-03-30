//
//  AlcoholModel.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//

import Foundation

struct AlcoholResponse: Codable {
    let drinks: [AlcoholModel]
}

struct AlcoholModel: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
