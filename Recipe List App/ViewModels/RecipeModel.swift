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
}
