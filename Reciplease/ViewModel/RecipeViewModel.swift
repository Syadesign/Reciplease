//
//  RecipeViewModel.swift
//  Reciplease
//
//  Created by Michael Martinez on 09/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import Foundation
import CoreData


class RecipeViewModel {
  
    static var shared = RecipeViewModel()
    
    var recipesArray: [Recipe]?
    
    func getRecipes(ingredients: [String], completion: @escaping () -> ()) {
        RecipeService.shared.getRecipes(ingredients) {
            (recipeArray) in
                    self.recipesArray = recipeArray
                    completion()
            }
        }
    }
    

