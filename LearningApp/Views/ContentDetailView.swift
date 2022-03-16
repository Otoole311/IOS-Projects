//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Otoole on 08/03/2022.
//


import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model:DataModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoUrl + (lesson?.video ?? ""))
        
        VStack
        {
            if url != nil
            {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                    .clipped()
                    .aspectRatio(contentMode: .fit)
            }
            
            //Todo: Description
            CodeTextView()
            
            //Next lesson
            if model.hasNextLesson(){
                Button {
                    //
                    model.nexLesson()
                } label: {
                    
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next lesson: \(model.currentModule!.content.lessons[model.currentModuleLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }

            }
            else
            {
                Button {
                    //take the user to homeview
                    model.currentContentSelected = nil
                } label: {
                    
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }

            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
