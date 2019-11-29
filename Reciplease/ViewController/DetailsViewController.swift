//
//  DetailsViewController.swift
//  Reciplease
//
//  Created by Michael Martinez on 08/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    weak var recipeViewModel: RecipeViewModel?
    
    // - MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    var selectedRow: Int?
    
    var recipe: Recipe?
    
    // - MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipe = recipe {
        self.titleLabel.text = recipe.label
        if let imageUrlString = recipe.image,
            let imageUrl = URL(string: imageUrlString) {
            self.imageView.kf.setImage(with: imageUrl)
        }
        }

    }
    

}

