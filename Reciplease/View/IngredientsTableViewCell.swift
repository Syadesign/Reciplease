//
//  IngredientsTableViewCell.swift
//  Reciplease
//
//  Created by Michael Martinez on 06/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var glypheView: UIView!
    
    func setupGlypheView() {
         glypheView.layer.cornerRadius = glypheView.frame.height / 2
    }
}
