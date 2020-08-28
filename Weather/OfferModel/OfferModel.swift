//
//  OfferModel.swift
//  Weather
//
//  Created by Пользователь on 13.08.2020.
//  Copyright © 2020 Raisat Ramazanova. All rights reserved.
//

import Foundation

class OfferModel: Codable {
    var cod: Int
    var name: String?
    var main: MainOfferModel
    var weather: [ListOfferModel]?
}
