//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        ZStack
        {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            
            HStack{
                //image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                //info
                VStack(alignment: .leading, spacing: 10.0)
                {
                    
                    //Headline
                    Text(title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        
                    
                    //Description
                    Text(description)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20.0)
                    
                    
                    //MARK: Icons
                    HStack{
                        //Number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        
                        //time duration
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                }
                .padding(.leading, 15.0)
            }
            .padding(.horizontal)
                
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "test title", description: "Some desctiption", count: "20 lessons", time: "3 hours")
    }
}
