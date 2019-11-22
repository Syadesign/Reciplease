//
//  RecipesViewController.swift
//  Reciplease
//
//  Created by Michael Martinez on 08/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit
import Alamofire

class RecipesViewController: UIViewController {
    
    // case search: self.tabBarController?.selectedIndex = 0
    
    // MARK: - Variables
    
    
    let research = ResearchViewController()
    
    //    var recipe: RecipeViewModel?
    
    private static let kCellId = "RecipesTableViewCell"
    
    weak var recipeViewModel: RecipeViewModel?
    
    // MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    
    // MARK: - Methods
    
    func setupTableView() {
        self.recipesTableView.delegate = self
        self.recipesTableView.dataSource = self
        let nib = UINib(nibName: RecipesViewController.kCellId, bundle: nil)
        self.recipesTableView.register(nib, forCellReuseIdentifier: RecipesViewController.kCellId)
    }
    
}

extension RecipesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeViewModel?.recipesArray?.count ?? 0
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesViewController.kCellId, for: indexPath) as! RecipesTableViewCell
        
        if let recipe = recipeViewModel?.recipesArray {
        cell.recipeTitleLabel.text = recipe[indexPath.row].label
        if let image = recipe[indexPath.row].image {
            // TODO download url image
            cell.recipeImageView.image = UIImage(named: image)
        }
        }
        return cell
    }
}
