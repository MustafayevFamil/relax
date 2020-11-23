//
//  ViewController.swift
//  Relax.az
//
//  Created by Famil Mustafayev on 12.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var networkManager = NetworkManager()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // networkManager.fetchRelax()
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(indexPath.row + 1)"
        
        return cell!
    }
    
    
}
//extension ViewController: NetworkManagerDelegate{
//    func updateInterface(_: NetworkManager, currentDataRelax: RelaxModelDataBaseIn) {
//        print(currentDataRelax.mezmun)
//    }
//}

