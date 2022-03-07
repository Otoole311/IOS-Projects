//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Otoole on 01/03/2022.
//

import Foundation

class RecipeModel: ObservableObject
{
    @Published var recipes = [Recipe]()
    
    init()
    {
        self.recipes = DataService.getLocalData()
    }
    
    
    static func getPortion(ingredients:Ingredient, recipeServing:Int, targetServing:Int) -> String{
        
        var portion = ""
        var numerator = ingredients.num ?? 1
        var denominator = ingredients.denom ?? 1
        var wholePortions = 0
        
        if ingredients.num != nil {
            //Get a single serving size by multiplying denom by the recipe servings
            denominator *= recipeServing
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServing
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numerator > denomitor
            if numerator >= denominator {
                
                //calculate whole portions
                wholePortions = numerator / denominator
                
                //calculate the remainder
                numerator = numerator % denominator
                
                //asign to portions string
                portion += String(wholePortions)
            }
            
            //Express the remainder as a fraction
            if numerator > 0{
                //assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredients.unit{
            //if we need to pluralize
            if wholePortions > 1 {
                
                //calculate appropriate unit
                if unit.suffix(2) == "ch"{
                    unit += "es"
                }
                else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else{
                    unit += "s"
                }
            }
            
            portion += ingredients.num == nil && ingredients.denom == nil ? "": " "
            
            return portion + unit
        }
       
        return portion
    }
}
