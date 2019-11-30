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
    
    @IBOutlet weak var getDirectionButtonView: UIButton!
    
    // - MARK: Actions
    
    @IBAction func getDirections(_ sender: Any) {
        guard let recipe = recipe else {return}
        if let url = URL(string: recipe.url!) {
           UIApplication.shared.open(url)
       }
    }
    
    // - MARK: Variables
    
    var selectedRow: Int?
    
    var recipe: Recipe?
    
    private static let kCellId = "IngredientsTableViewCell"
    
    // - MARK: View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipe = recipe {
        self.titleLabel.text = recipe.label
        if let imageUrlString = recipe.image,
            let imageUrl = URL(string: imageUrlString) {
            self.imageView.kf.setImage(with: imageUrl)
        }
        setupTableView()
        }

    }
    
    func setupTableView() {
        self.ingredientsTableView.delegate = self
        self.ingredientsTableView.dataSource = self
        let nib = UINib(nibName: DetailsViewController.kCellId, bundle: nil)
        self.ingredientsTableView.register(nib, forCellReuseIdentifier: DetailsViewController.kCellId)
    }
    

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipe = recipe else {return 0}
        guard let ingredients = recipe.ingredients else {return 0}
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsViewController.kCellId, for: indexPath) as! IngredientsTableViewCell
         if let recipe = recipe {
            cell.ingredientLabel.text = recipe.ingredients?[indexPath.row].text
        }
        return cell
    }
    
    
}

