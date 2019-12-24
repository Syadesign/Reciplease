//
//  RecipeService.swift
//  Reciplease
//
//  Created by Samahir Adi on 21/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import Foundation
import Alamofire

class RecipeService {
    
    // MARK: - Initialize
    
    static let shared = RecipeService()
    private init() {}
    
    // MARK: - Variables
    
    let apiUrl = URL(string: "https://api.edamam.com/search?")
    let apiKey = "f67d7bbab299754eeed0ae0c45329acf"
    let appId = "a76d7c56"
    let from = "0"
    let to = "8"
    let unit = "g"
    
    // MARK: - Methods
    
    func getRecipes(_ ingredients: [String], callback: @ escaping ([Recipe]) -> Void) {

        let parameters: [String: String] = [
            "q": ingredients.joined(separator: ","),
            "app_id": appId,
            "app_key": apiKey,
            "from": from,
            "to": to,
            "Unit": unit
        ]
        
        guard let url = apiUrl else {return}
        
        Alamofire.request(url,
                   method: .get,
                   parameters: parameters).responseData { (data) in
                    switch data.result {
                    case .failure(let error):
                        print (error)
                    case .success:
                        if let body = data.value {
                            let result = try? JSONDecoder().decode(RecipeResult.self, from: body)
                            let recipeArray = result?.hits?.compactMap({ (hit) in
                                hit.recipe
                            }) ?? []
                            callback(recipeArray)
                            print (body)
                        }
                    }
        }
        
        
        
        
    
        
        
    }
    
    
}
