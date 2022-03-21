//
//  TestView.swift
//  LearningApp
//
//  Created by Otoole on 21/03/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:DataModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack{
                //question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                //question
                CodeTextView()
                //answers
                //button
            }
            .navigationBarTitle("\(model.currentModule?.category ?? " ") Test")
        }
        else
        {
            //Test hasn't loaded yet
            ProgressView()
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
