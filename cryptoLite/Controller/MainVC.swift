//
//  ViewController.swift
//  cryptoLite
//
//  Created by Cody Condon on 2020-11-23.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var coinArray = [Coin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        fetchData()
        self.tableView.reloadData()
        
    }
    
    
    
    func fetchData() {
        let url = URL(string: coinCall)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
           
            if error == nil && data != nil  {
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data!)
                    for result in results.data {
                        let coin = Coin(name: result.name, symbol: result.symbol, price: result.quote.USD.price)
                        self.coinArray.append(coin)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                
            }
            
            
           
        }

        task.resume()
        
    }
    
    


}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CoinCell {
            
            let coin = coinArray[indexPath.row]
            cell.configureCell(coin: coin)
            return cell 
        } else {
            return CoinCell()
        }
                 
       
        
    }
    
    
}

