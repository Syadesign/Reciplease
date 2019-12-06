
import Foundation
import CoreData


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




