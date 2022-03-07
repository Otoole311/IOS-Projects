//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Otoole on 01/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServing = 2
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                //MARK: Picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServing){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                }
                .padding([.top, .leading])
                
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    
                    ForEach(recipe.ingredients){
                        item in
                        Text("• " + RecipeModel.getPortion(ingredients: item, recipeServing: recipe.servings, targetServing: selectedServing) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){
                        index in
                        
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 5.0)
                    }
                }
                .padding(.horizontal)
                
                
                
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it into the detail view so that we can see the previes
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
