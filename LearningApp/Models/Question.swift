//
//  Question.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

struct Question: Identifiable, Decodable{
    var id:Int
    var content:String
    var correctIndex:Int
    var answers:[String]
}
