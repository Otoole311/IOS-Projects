//
//  ContentView.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:DataModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Choose something to do today..")
                    .padding(.leading, 20.0)
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){
                            module in
                            
                            VStack(spacing: 20.0)
                            {
                                //learning card
                                //MARK: Learning Card
                                NavigationLink(destination:
                                                ContentView()
                                                .onAppear(perform:
                                                            {
                                    model.beginModule(module_id: module.id)
                                }),
                                               tag: module.id,
                                               selection: $model.currentContentSelected,
                                               label: {
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                                
                                
                                NavigationLink(destination: TestView().onAppear(perform: {model.beginTest(module_Id: module.id)}), tag: module.id, selection: $model.currentTestSelected) {
                                    //
                                    HomeViewRow(image: module.test.image, title: " \(module.category) test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                }
                                
                            
                               
                            }
                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                }
            }
            .accentColor(.black)
            .navigationTitle("Get Started")
            .onChange(of: model.currentContentSelected, perform: {ChangedValue in
                if ChangedValue == nil {
                    model.currentModule = nil
                }
            })
            .onChange(of: model.currentTestSelected, perform: {ChangedValue in
                if ChangedValue == nil {
                    model.currentModule = nil
                }
            })
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DataModel())
    }
}
