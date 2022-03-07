//
//  DataService.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

class DataService
{

    static func getLocalData() -> [Module]
    {
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do
        {
                //Read file into data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            return modules
        }
        catch{
            //
            print(error)
        }
        
        return [Module]()
    }
}
