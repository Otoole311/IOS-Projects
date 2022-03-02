//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Otoole on 02/03/2022.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State private var TabIndex:Int = 0
    
    var body: some View {
        
        TabView(selection: $TabIndex) {
            
            //MARK: Feature view
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)
            
            //MARK: Recipe list view
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Recipes")
                    }
                }.tag(1)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
