//
//  Favorite.swift
//  Reciplease
//
//  Created by Samahir Adi on 06/12/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import Foundation
import CoreData

class Favorite: NSManagedObject {
    
    var ingredientsArray: [Ingredient] = []
    
    static func addFavorite(recipe: Recipe){
        let favorite = Favorite(context: AppDelegate.viewContext)
        favorite.recipeTitle = recipe.label
        favorite.image = recipe.image
        if let ingredients = recipe.ingredients {
        favorite.ingredientsArray = ingredients
        }
        try? AppDelegate.viewContext.save()
    }
    
    static func fetchFavorites() -> [Favorite] {
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        guard let favorites = try? AppDelegate.viewContext.fetch(request) else {return []}
        return favorites
    }
}


