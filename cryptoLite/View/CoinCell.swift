//
//  CoinCell.swift
//  cryptoLite
//
//  Created by Cody Condon on 2020-11-24.
//

import UIKit

class CoinCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(coin: Coin) {
        nameLbl.text = coin.name
        priceLbl.text = coin.symbol
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
