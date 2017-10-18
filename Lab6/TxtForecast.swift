//
//  TxtForecast.swift
//  Lab6
//
//  Created by Local Account 436-01 on 10/18/17.
//  Copyright © 2017 Local Account 436-01. All rights reserved.
//

import Foundation

struct TxtForecast : Codable {
    var date: String
    var forecastDays : [ForecastDay]
    
    private enum CodeingKeys: String, CodingKey {
        case data
        case forecastdays = "forecastday"
    }
    
    struct ForecastDay: Codable {
        
    }
}
