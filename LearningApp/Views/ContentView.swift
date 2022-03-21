//
//  LessonListView.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        
        ScrollView{
            LazyVStack{
                
                //ensure current module exists
                if(model.currentModule != nil){
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        NavigationLink {
                            ContentDetailView()
                                .onAppear {
                                    model.beginLesson(lessonIndex: index)
                                }
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//   
//    static var previews: some View {
//        ContentView()
//            .environmentObject(DataModel())
//    }
//}
