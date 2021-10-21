//
//  ViewModelType.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 4/28/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
protocol ViewModelType {
    var dataDriver : Driver<[Currency]>{set get}
    func fetchDataFromNetwork()
    func filterData(word:String)
    
    
}
