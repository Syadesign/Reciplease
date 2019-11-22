// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipe = try? newJSONDecoder().decode(Recipe.self, from: jsonData)

import Foundation

// MARK: - RecipeResult
struct RecipeResult: Decodable {
    let q: String?
    let from, to: Int?
    let more: Bool?
    let count: Int?
    let hits: [Hit]?
}

// MARK: - Hit
struct Hit: Decodable {
    let recipe: Recipe?
    let bookmarked, bought: Bool?
}

// MARK: - Recipe
struct Recipe: Decodable {
    let uri: String?
    let label: String?
    let image: String?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Int?
    let dietLabels: [String]?
    let cautions, ingredientLines: [String]?
    let ingredients: [Ingredient]?
    let calories, totalWeight: Double?
    let totalTime: Int?
}



enum SchemaOrgTag {
    case carbohydrateContent
    case cholesterolContent
    case fatContent
    case fiberContent
    case proteinContent
    case saturatedFatContent
    case sodiumContent
    case sugarContent
    case transFatContent
}

enum Unit {
    case empty
    case g
    case iu
    case kcal
    case mg
    case µg
}



// MARK: - Ingredient
struct Ingredient: Decodable {
    let text: String?
    let weight: Double?
}




