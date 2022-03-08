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
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
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

