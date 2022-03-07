//
//  ContentView.swift
//  SpinnerApp
//
//  Created by Otoole on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var creditScore:Int = 1000
    @State var image1:String = "apple"
    @State var image2:String = "apple"
    @State var image3:String = "apple"
    
    func randomizeImage() -> String{
        
        let randNumber = Int.random(in: 1...3)
        
        if randNumber == 1{
            return "apple"
        }
        else if randNumber == 2{
            return "cherry"
        }
        else
        {
            return "star"
        }
    }
    
    //increasse credit score by a value
    func increaseScoreBy(value:Int){
        creditScore += value
    }
    
    //decrease credit score by a value
    func decreaseScoreBy(value:Int){
        creditScore -= value
    }
    
    func calculationDecision(){
        //if all three are equal
        if((image1 == image2)  && (image2 == image3)){
            increaseScoreBy(value: 15)
        }
        else
        {
            decreaseScoreBy(value: 5)
        }
        
    }
    
    
    var body: some View {
        
        VStack{
            //Title
            Text("SwiftUI Slots")
            
            
            Spacer()
            //Credits
            Text("Credits: \(creditScore) ")
            
            Spacer()
            //Images stack
            HStack{
                Image(image1).resizable()
                    .aspectRatio(contentMode: .fit)
                Image(image2).resizable()
                    .aspectRatio(contentMode: .fit)
                Image(image3).resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            
            Spacer()
            
            //Spin Button
            Button {
                //
                image1 = randomizeImage()
                image2 = randomizeImage()
                image3 = randomizeImage()
                
                calculationDecision()
                
            } label: {
                Text("Spin").foregroundColor(Color.white).padding().frame(width: 150.0).background(Color.red).cornerRadius(20)
            }
            
            
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
