//
//  DataModel.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

class DataModel: ObservableObject{
    
    var modules = [Module]()
    
    init(){
        self.modules = DataService.getLocalData()
    }
}
