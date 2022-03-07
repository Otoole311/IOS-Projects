//
//  ContentView.swift
//  war-challenge
//
//  Created by Otoole on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        //Main satack
        ZStack{
            
            //background image
            Image("background").ignoresSafeArea()
            
            VStack{
                Spacer()
                //war logo
                Image("logo")
                
                Spacer()
                
                //horizontal stack for the cards
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                //deal button
                Button {
                    
                    //generate random number between 2 to 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    //update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //update the score
//                    playerScore += 1
//                    cpuScore += 1
                    
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }
                    else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                   
                } label: {
                    Image("dealbutton")
                }

                
                Spacer()
                
                //Horizontal stack for scores
                HStack{
                    
                    Spacer()
                    //vertical stack for player
                    VStack{
                        Text("Player").font(.headline)
                            .foregroundColor(Color.white).padding()
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.white).padding()
                    }
                    Spacer()
                    //vertical stack for CPU
                    VStack{
                        Text("CPU").font(.headline)
                            .foregroundColor(Color.white).padding()
                        Text(String(cpuScore)).font(.largeTitle).foregroundColor(Color.white).padding()
                    }
                    Spacer()
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
