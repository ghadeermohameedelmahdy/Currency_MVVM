//
//  Currency.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 5/2/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
struct Currency {
    var currency : String
    var value : Double
    
}
struct Data : Codable{
    var rates : Dictionary<String,Double>
}
