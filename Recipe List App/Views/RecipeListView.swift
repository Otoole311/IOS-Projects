//
//  ContentView.swift
//  Recipe List App
//
//  Created by Otoole on 01/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var recipeModel:RecipeModel
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top,40)
                    .font(.largeTitle)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(recipeModel.recipes)
                        { r in
                            
                            NavigationLink
                            {
                                RecipeDetailView(recipe: r)
                            } label:
                            {
                                
                                //MARK: Row item
                                HStack(spacing: 20.0)
                                {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            
                        }
                    }
                }
                
                
            }.navigationBarHidden(true)
                .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
