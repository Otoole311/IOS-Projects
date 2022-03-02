//
//  Recipe.swift
//  Recipe List App
//
//  Created by Otoole on 01/03/2022.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured: Bool
    var image:String
    var description:String
    var prepTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
    
}
