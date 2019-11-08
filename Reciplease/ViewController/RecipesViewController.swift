//
//  RecipesViewController.swift
//  Reciplease
//
//  Created by Michael Martinez on 08/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    // MARK: - Variables
    var recipesArray: [String] = ["Buddah Bowl", "Chicken curry", "Pasta soup"] {
        didSet {
            self.recipesTableView.reloadData()
        }
    }
    
    var recipesImages: [UIImage] = [#imageLiteral(resourceName: "recipeExample"), #imageLiteral(resourceName: "recipeExample"), #imageLiteral(resourceName: "recipeExample")]{
        didSet {
            self.recipesTableView.reloadData()
        }
    }
    
    var recipesTime: [String] = ["15 min", "20 min", "30 min"] {
        didSet {
            self.recipesTableView.reloadData()
        }
    }

    private static let kCellId = "RecipesTableViewCell"
    
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
            return recipesArray.count
        }
        
        func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipesViewController.kCellId, for: indexPath) as! RecipesTableViewCell
            cell.recipeTitleLabel.text = recipesArray[indexPath.row]
            cell.timeRecipeLabel.text = recipesTime[indexPath.row]
            cell.recipeImageView.image = recipesImages[indexPath.row]
            return cell
        }
}
