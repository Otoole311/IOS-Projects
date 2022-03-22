//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Otoole on 08/03/2022.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model:DataModel
    var index:Int
    
    var lesson: Lesson{
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count{
            return model.currentModule!.content.lessons[index]
        }
        else{
            return Lesson(id: 0, title: "", video:"" , duration: "", explanation: "")
        }
    }
    
    
    var body: some View {
        //lasson card
        ZStack(alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 20)
            {
                Text(String(index + 1))
                    .bold()
                
                VStack(alignment: .leading)
                {
                    Text(lesson.title)
                        .bold()
                        .font(.headline)
                    
                    Text(lesson.duration)
                        .font(.caption)
                    
                }
                .padding(.leading, 20.0)
                
            }
            .padding()
            
        }
        .padding(.bottom, 10.0)
    }
}

