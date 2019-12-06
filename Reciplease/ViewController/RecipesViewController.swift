//
//  RecipesViewController.swift
//  Reciplease
//
//  Created by Samahir Adi on 08/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class RecipesViewController: UIViewController {
    
    // MARK: - Variables
    
    private static let kCellId = "RecipesTableViewCell"
    
    weak var recipeViewModel: RecipeViewModel?
    
    var detailsViewController = DetailsViewController()
    
    let segueIndentifier = "SegueToDetails"
    
    // MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIndentifier {
           let detailsViewController = segue.destination as! DetailsViewController
            let selectedRow = recipesTableView.indexPathForSelectedRow!.row
                
                detailsViewController.recipe = recipeViewModel?.recipesArray?[selectedRow]
                
            
        }
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
            if let time = recipe[indexPath.row].totalTime{
                if time == 0 {
                    cell.timeRecipeLabel.text = "Not available"
                } else {
                    cell.timeRecipeLabel.text = String(describing: time) + " min"
                }
                
            }
            cell.recipeTitleLabel.text = recipe[indexPath.row].label
            if let imageUrlString = recipe[indexPath.row].image,
                let imageUrl = URL(string: imageUrlString) {
                cell.recipeImageView.kf.setImage(with: imageUrl)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            self.performSegue(withIdentifier: segueIndentifier, sender: self)

    }
    

}
