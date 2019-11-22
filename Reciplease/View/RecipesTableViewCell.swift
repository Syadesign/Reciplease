//
//  RecipesTableViewCell.swift
//  Reciplease
//
//  Created by Michael Martinez on 08/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    // MARK: - view cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupRecipeImage()
    }
    
//    var recipe: RecipeViewModel? = nil {
//        didSet {
//            self.recipeTitleLabel.text = recipe?.title
//        }
//    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var timeRecipeLabel: UILabel!
    
    // MARK: - Functions
    
    func setupRecipeImage() {
        recipeImageView.layer.cornerRadius = recipeImageView.frame.height / 8
    }
}
