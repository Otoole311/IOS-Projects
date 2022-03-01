//
//  DataService.swift
//  Recipe List App
//
//  Created by Otoole on 01/03/2022.
//

import Foundation

class DataService
{
    static func getLocalData() -> [Recipe]
    {
        //get url path to file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if path is not nil otherwise...
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do
        {
            //create data object
            let data = try Data(contentsOf: url)
            
            //decode the data with json decoder
            let decoder = JSONDecoder()
            
            do
            {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add unique ids
                for r in recipeData{
                    r.id = UUID()
                }
                
                //return recipes
                return recipeData
            }
            catch
            {
                //error with parsing json
                print(error)
            }
        }
        catch
        {
            //error with getting data
                print(error)
        }
     
        return [Recipe]()
    }
    
}
