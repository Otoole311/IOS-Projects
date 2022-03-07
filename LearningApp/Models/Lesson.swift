//
//  Lesson.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

struct Lesson: Identifiable, Decodable
{
    var id:Int
    var title:String
    var video:String
    var duration:String
    var explanation:String
    
}
