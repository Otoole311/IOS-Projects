//
//  TestResultView.swift
//  LearningApp
//
//  Created by Otoole on 21/03/2022.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:DataModel
    var numCorrect:Int
    
    var resultHeading:String{
        
        guard model.currentModule != nil else{
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        }
        else if pct > 0.2 {
            return "Doing great!"
        }
        else {
            return "Keep Learning"
        }
    }
    
    var body: some View {
        
        VStack{
            Spacer()
            Text(resultHeading)
                .font(.title)
            Spacer()
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            Button {
                //
                model.currentTestSelected = nil
            } label: {
                ZStack{
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            Spacer()

        }
        .padding()
        
    }
}

//struct TestResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestResultView()
//    }
//}
