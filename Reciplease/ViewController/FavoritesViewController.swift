//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Michael Martinez on 04/12/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    // MARK: - Variables
    
    private static let kCellId = "RecipesTableViewCell"
    
    weak var recipeViewModel: RecipeViewModel?
    
    
//            let request = NSFetchRequest<RecipeViewModel>(entityName: "RecipeViewModel")
//            guard let recipe = try? AppDelegate.viewContext.fetch(request) else {return}
//            for i in recipe {
//                self.favorites = i.favoritesRecipes
//            }

    var detailsViewController = DetailsViewController()
    
    let segueIndentifier = "SegueToFavoritesDetails"
    
    var favorites : [Favorite]? = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var favoritesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = Favorite.fetchFavorites()
        self.favoritesTableView.reloadData()
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == segueIndentifier {
              let detailsViewController = segue.destination as! DetailsViewController
               let selectedRow = favoritesTableView.indexPathForSelectedRow!.row
                   
                   detailsViewController.recipe = recipeViewModel?.recipesArray?[selectedRow]
            
               
           }
    }
        
        func setupTableView() {
               self.favoritesTableView.delegate = self
               self.favoritesTableView.dataSource = self
               let nib = UINib(nibName: FavoritesViewController.kCellId, bundle: nil)
               self.favoritesTableView.register(nib, forCellReuseIdentifier: FavoritesViewController.kCellId)
           }
    
}


extension FavoritesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesViewController.kCellId, for: indexPath) as! RecipesTableViewCell
        
        if let favorites = favorites {
        cell.recipeTitleLabel.text = favorites[indexPath.row].recipeTitle
        }
//        if let recipe = recipeViewModel?.recipesArray {
//            if let time = recipe[indexPath.row].totalTime{
//                if time == 0 {
//                    cell.timeRecipeLabel.text = "Not available"
//                } else {
//                    cell.timeRecipeLabel.text = String(describing: time) + " min"
//                }
//
//            } else {
//                cell.timeRecipeLabel.text = "Not available"
//            }
//            cell.recipeTitleLabel.text = recipe[indexPath.row].label
//            if let imageUrlString = recipe[indexPath.row].image,
//                let imageUrl = URL(string: imageUrlString) {
//                cell.recipeImageView.kf.setImage(with: imageUrl)
//            }
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            self.performSegue(withIdentifier: segueIndentifier, sender: self)

    }
    

}

extension FavoritesViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.favoritesTableView.reloadData()
        print("reload data")
    }
    
}

