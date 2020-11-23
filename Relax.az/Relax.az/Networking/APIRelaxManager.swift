//
//  APIRelaxManager.swift
//  Relax.az
//
//  Created by Famil Mustafayev on 15.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation

struct Address {
    let function: String
    let dataBase: String
}
enum ForecastType: FinalUrlPoint{
    
    case Current(address: Address)
    var baseURL: URL{
        return URL(string: "https://relax.az")!
    }
    var path: String{
        switch self {
        case .Current(let address):
            return "/_functions/\(address.function)/\(address.dataBase)"
        }
    }
    var request: URLRequest{
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
}

final class APIRelaxManager: APIManager{
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    let dataBase: String
    
    init(sessionConfiguration: URLSessionConfiguration, dataBase: String) {
        self.sessionConfiguration = sessionConfiguration
        self.dataBase = dataBase
    }
    
    convenience init(dataBase: String){
        self.init(sessionConfiguration: URLSessionConfiguration.default, dataBase: dataBase)
    }
    func fetchCurrentleRelaxWith(address: Address, completionHandler: (APIResult<RelaxModelDataBaseIn>)) -> Void{
        let request = ForecastType.Current(address: address).request
        
        fetch(request: request, parse: { (json) -> RelaxModelDataBaseOut? in
            if let dict = json["currently"] as? [String: AnyObject]{
                return RelaxModelDataBaseOut(
            }
        }) { (completionHandler) in
            
        }
    }
}
