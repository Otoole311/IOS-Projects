//
//  TestView.swift
//  LearningApp
//
//  Created by Otoole on 21/03/2022.
//

import SwiftUI
import simd

struct TestView: View {
    
    @EnvironmentObject var model:DataModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack(alignment: .leading){
                //question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20.0)
                
                //question
                CodeTextView()
                    .padding(.leading, 20.0)
                
                //answers
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self){
                            index in
                            
                            Button {
                                // track the selected index
                                selectedAnswerIndex = index
                            } label: {
                                
                                ZStack{
                                    
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    else
                                    {
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex{
                                            //user selected correct answer
                                            //show a green bacground
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex{
                                            //user selecte wrong answer
                                            //show red background
                                            RectangleCard(color: .red)
                                                .frame(height: 48)
                                        }
                                        else if index == model.currentQuestion!.correctIndex{
                                            // this button is the correct answer
                                            //show a green background
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        }
                                        else{
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    }
                                    
                                    Text(model.currentQuestion!.answers[index])
                                }
                            }
                            .disabled(submitted)

                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                // submitbutton
                Button {
                    
                    //check if answer has been submitted
                    if submitted == true {
                        //Answer has already been submitted, move to next question
                        model.nextQuestion()
                        
                        //reset properties
                        submitted = false
                        selectedAnswerIndex = nil
                    }
                    else{
                        //
                        submitted = true
                        
                        //
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex{
                            numCorrect += 1
                        }
                    }
                    
                   
                } label: {
                    
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()

                }.disabled(selectedAnswerIndex == nil)

            }
            .navigationBarTitle("\(model.currentModule?.category ?? " ") Test")
        }
        else
        {
            //Test hasn't loaded yet
            ProgressView()
        }
    }
    
    var buttonText:String {
        //check if answer has been submtted
        
        if submitted == true{
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count{
                return "Finish"
            }
            else
            {
                return "Next" // of finish
            }
        }
        else{
            return "Submited"
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
