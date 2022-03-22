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
    
    
    static func getStyling() ->Data{
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do
        {
            let styleData = try Data(contentsOf: styleUrl!)
            return styleData
        }
        catch
        {
            print(error)
        }
        return Data()
    }
    
    static func getRemoteData() -> [Module]{
        var result = [Module]()
        //String path
        let urlString = "https://otoole311.github.io/learningapp-data/data2.json"
        
        //create a url object
        let url = URL(string: urlString)
        
        guard url != nil else{
            //could not create url
            return [Module]()
        }
        
        //create a urlrequst object
        let request = URLRequest(url:url!)
        
        //get the seession and kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            //check if there's an error
            guard error == nil else{
                //there was an error
                return
            }
            
            //create json decoder
            do{
                let decoder = JSONDecoder()
                
                //decode
                let modules = try decoder.decode([Module].self,from: data!)
                result = modules
            }
            catch{
                //couldnt pass json
            }
            //handle the response
        }
        
        //kick off data task
        dataTask.resume()
        
        return result
    }
}
