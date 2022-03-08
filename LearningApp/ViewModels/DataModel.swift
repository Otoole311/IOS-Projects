//
//  DataModel.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

class DataModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    var styleData: Data?
    //current Module
    @Published var currentModule: Module?//keep the state of what lesson or question the user is on
    var currentModuleIndex = 0
    
    init(){
        self.modules = DataService.getLocalData()
    }
    
    func beginModule(module_id:Int){
        
        //find the index for this module id
        if let index = self.modules.firstIndex(where: {$0.id == module_id})
        {
            currentModuleIndex = index
        }
        
        //set the current module
        currentModule = modules[currentModuleIndex]
    }
}
