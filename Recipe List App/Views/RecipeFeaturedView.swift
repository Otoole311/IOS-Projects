//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Otoole on 02/03/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @State var isDetailViewShowing = false
    @EnvironmentObject var recipeModel:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            //MARK: Title
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            //MARK: Geo-reader
            GeometryReader{
                geo in
                
                TabView
                {
                    ForEach(0..<recipeModel.recipes.count){
                        index in
                        if(recipeModel.recipes[index].featured){
                            
                            //Recipe card button
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label:{
                                
                                //featured recipe card
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack{
                                        Image(recipeModel.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        Text(recipeModel.recipes[index].name)
                                    }
                                }
                            })
                                .sheet(isPresented: $isDetailViewShowing){
                                    RecipeDetailView(recipe: recipeModel.recipes[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100,alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            //MARK: Others
            
            VStack(alignment: .leading, spacing: 10){
                
                Text("Preparation Time:")
                    .font(.headline)
                
                Text("Somehting")
                
                Text("HighLights:")
                    .font(.headline)
                Text("Somehting")
            }
            .padding(.leading)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
