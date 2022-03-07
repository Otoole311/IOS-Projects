//
//  Test.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

struct Test: Identifiable, Decodable
{
    var id:Int
    var image:String
    var time:String
    var description:String
    var questions: [Question]
}
