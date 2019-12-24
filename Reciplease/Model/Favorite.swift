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
    
    var ingredientsArray: [String] {
        return self.ingredients?.components(separatedBy: ",") ?? []
    }
    
    static func addFavorite(recipe: Recipe){
        let favorite = Favorite(context: AppDelegate.viewContext)
        favorite.recipeTitle = recipe.label
        favorite.image = recipe.image
        favorite.totalTime = Double(recipe.totalTime ?? 0)
        if let ingredients = recipe.ingredientLines {
        favorite.ingredients = ingredients.joined(separator: ",")
        }
        try? AppDelegate.viewContext.save()
    }
    
    static func fetchFavorites() -> [Favorite] {
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        guard let favorites = try? AppDelegate.viewContext.fetch(request) else {return []}
        return favorites
    }
}


