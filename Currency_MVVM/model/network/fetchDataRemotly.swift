//
//  fetchDataRemotly.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 5/2/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
func fetchData<T:Codable> (url:String,completionHandler:@escaping (_ result:T)->Void){
       Alamofire.request(url)
           .responseJSON { (response) in
                if let data = response.data {
                    do{
                let json = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(json)
                    }catch{
                        print(error)
                    }

               }
       }
   }
