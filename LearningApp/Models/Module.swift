//
//  Module.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

struct Module: Identifiable, Decodable
{
    var id:Int
    var category:String
    var content: Content
    var test: Test
}

