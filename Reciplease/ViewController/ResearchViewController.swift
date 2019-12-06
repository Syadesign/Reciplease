//
//  ResearchViewController.swift
//  Reciplease
//
//  Created by Samahir Adi on 06/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class ResearchViewController: UIViewController {
    
    // MARK: - Variables
    var ingredientsArray: [String] = [] {
        didSet {
            self.ingredientsTableView.reloadData()
        }
    }
    private static let kCellId = "IngredientsTableViewCell"

    
    var recipe: [Recipe] = []
    
    let recipeViewModel = RecipeViewModel()
    
    let segueIndentifier = "segueToRecipes"
    
    // MARK: - Outlets
    @IBOutlet weak var ingredientsTextField: UITextField!
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    @IBOutlet var ButtonsViews: [UIButton]!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        setupButtonView()
        setupTableView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIndentifier {
            let recipesViewController = segue.destination as! RecipesViewController
            recipesViewController.recipeViewModel = self.recipeViewModel
        }
    }
    
    // MARK: - Actions
    @IBAction func addIngredientsButton(_ sender: Any) {
        if let text = ingredientsTextField.text {
            ingredientsArray.append(text)
            print ("TEXT ingredients \(text)")
        }
        ingredientsTextField.text = ""
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.ingredientsTextField.resignFirstResponder()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        recipeViewModel.getRecipes(ingredients: ingredientsArray) {
            self.performSegue(withIdentifier: self.segueIndentifier, sender: self)
        }
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        ingredientsArray.removeAll()
    }
    
    // MARK: - Methods
    func setupButtonView() {
        for i in ButtonsViews {
            i.layer.cornerRadius = i.frame.height / 8
        }
    }
    
    func setupTableView() {
        self.ingredientsTableView.delegate = self
        self.ingredientsTableView.dataSource = self
        let nib = UINib(nibName: ResearchViewController.kCellId, bundle: nil)
        self.ingredientsTableView.register(nib, forCellReuseIdentifier: ResearchViewController.kCellId)
    }

}

extension ResearchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResearchViewController.kCellId, for: indexPath) as! IngredientsTableViewCell
        cell.ingredientLabel.text = ingredientsArray[indexPath.row]
        return cell
    }
    
    
}
