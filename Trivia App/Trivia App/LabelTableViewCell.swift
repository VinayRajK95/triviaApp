//
//  LabelTableViewCell.swift
//  Trivia App
//
//  Created by Vinay Raj K on 24/01/20.
//  Copyright © 2020 Vinay Raj K. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell, ConfigureCellProtocol {

    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(key: String, value: String) {
        labelOne.text = key
        labelTwo.text = value
    }

}

protocol ConfigureCellProtocol {
    func configureCell(key: String, value: String)
}
