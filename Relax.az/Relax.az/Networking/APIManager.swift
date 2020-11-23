//
//  APIManager.swift
//  Relax.az
//
//  Created by Famil Mustafayev on 15.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

protocol FinalUrlPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
    
    //init(sessionConfiguration: URLSessionConfiguration)
}

extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                let error = NSError(domain: FAMNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                
                completionHandler(nil, nil, error)
                return
            }
            if data == nil{
                if let error = error{
                    completionHandler(nil, HTTPResponse, error)
                }else{
                    switch HTTPResponse.statusCode{
                    case 200:
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                            completionHandler(json, HTTPResponse, nil)
                        }catch let error as NSError{
                            completionHandler(nil, HTTPResponse, error)
                        }
                    default:
                        print("We have got response status \(HTTPResponse.statusCode)")
                    }
                }
            }
        }
        return dataTask
    }
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void){
        let dataTask = JSONTaskWith(request: request) { (json, response, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error{
                        completionHandler(APIResult.Failure(error))
                    }
                    return
                }
                if let value = parse(json){
                    completionHandler(APIResult.Success(value))
                }else{
                    let error = NSError(domain: FAMNetworkingErrorDomain, code: UnexpectedResponseError, userInfo: nil)
                    completionHandler(APIResult.Failure(error))
                }
            }
        }
        dataTask.resume()
    }
    
}

