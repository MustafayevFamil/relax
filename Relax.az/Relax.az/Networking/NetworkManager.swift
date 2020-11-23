//
//  NetworkManager.swift
//  Relax.az
//
//  Created by Famil Mustafayev on 12.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

//import Foundation
//struct NetworkManager {
//    func fetchRelax(){
//        let jsonString = "https://www.relax.az/_functions/api/\(dataBaseRelax)"
//        guard let url = URL(string: jsonString) else { return }
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let dataTask = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do{
//                let relaxData = try JSONDecoder().decode(RelaxModelDataBaseOut.self, from: data)
//                print(relaxData.relax[0].elanAdi)
//            }catch let error{
//                print("Error \(error.localizedDescription)")
//            }
//        }
//        dataTask.resume()
//    }
//}
//func parseJSON(withData data: Data) -> RelaxModelDataBaseIn?{
//    let decoder = JSONDecoder()
//    do {
//        let relaxDataOut = try decoder.decode(RelaxModelDataBaseOut.self, from: data)
//        guard let relaxDataIn = RelaxModelDataBaseIn(relaxDataBase: relaxDataOut) else { return nil }
//        return relaxDataIn
//
//    } catch let error as NSError {
//        print(error.localizedDescription)
//    }
//    return nil
//}
