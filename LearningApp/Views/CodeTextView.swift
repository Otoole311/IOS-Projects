//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Otoole on 09/03/2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
   
    @EnvironmentObject var model:DataModel
    
    func makeUIView(context: Context) -> UITextView {
        //
        let textview = UITextView()
        textview.isEditable = false
        
        return textview
    }
    
    func updateUIView(_ textview: UITextView, context: Context) {
        //set the attributed text for the lesson
        textview.attributedText = model.codeText
        //scroll back to the top
        textview.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
