//
//  ViewController.swift
//  cryptoLite
//
//  Created by Cody Condon on 2020-11-23.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var coins: [Coin] = [
        Coin(name: "Bitcoin", price: "20,000"),
        Coin(name: "Eth", price: "20,000"),
        Coin(name: "Chainlink", price: "20,000")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CoinCell {
            
            let coin = coins[indexPath.row]
            cell.configureCell(coin: coin)
            return cell 
        } else {
            return CoinCell()
        }
                 
       
        
    }
    
    
}

