//
//  Content.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

struct Content: Identifiable, Decodable
{
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons:[Lesson]
    
}
