//
//  TxtForecastService.swift
//  Lab6
//
//  Created by Local Account 436-01 on 10/23/17.
//  Copyright © 2017 Local Account 436-01. All rights reserved.
//

import Foundation

struct TxtForecastService : Codable {
    let forecast : Forecast

    struct Forecast : Codable {
        let txt_forecast : TxtForecast
    }
}
