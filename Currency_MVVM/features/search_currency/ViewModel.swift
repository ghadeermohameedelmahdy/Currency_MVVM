//
//  ViewModel.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 4/28/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
class ViewModel: ViewModelType {
    var dataDriver: Driver<[Currency]>
    private var currencyArr : [Currency] = []
    private var dataSubject = PublishSubject<[Currency]>()
    init() {
        dataDriver = dataSubject.asDriver(onErrorJustReturn: [])
    }
    func fetchDataFromNetwork() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else{return}
            fetchData(url: CURRENCY_URL) { (data : Data) in
                     // print(data)
                      for curr in data.rates {
                          let currency = Currency.init(currency: curr.key, value: curr.value)
                        self.currencyArr.append(currency)
                      }
                self.dataSubject.onNext(self.currencyArr)
                  }
            
        }
    }
    
    func filterData(word:String) {
        let filteredArr = currencyArr.filter { (currency) -> Bool in
            return currency.currency.hasPrefix(word)
        }
            self.dataSubject.onNext(filteredArr)
       
        
    }
    
    
}
