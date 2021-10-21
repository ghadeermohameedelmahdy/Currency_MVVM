//
//  CurrencyTableViewCell.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 5/2/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    var currency : Currency? {
        willSet
        {
            self.textLabel?.text = currency?.currency
            self.detailTextLabel?.text = String(format:"%f", currency?.value ?? 0.0)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
