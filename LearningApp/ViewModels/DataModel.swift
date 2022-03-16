//
//  DataModel.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import Foundation

class DataModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    
    //current Module
    @Published var currentModule: Module?//keep the state of what lesson or question the user is on
    var currentModuleIndex = 0
    
    //keep track of current lesson the user is taking
    @Published var currentLesson: Lesson?
    var currentModuleLessonIndex = 0
    
    //Current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    var styleData: Data?

    //current selected content and test
    @Published var currentContentSelected:Int?
    
    init(){
        self.modules = DataService.getLocalData()
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do
        {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch
        {
            print(error)
        }
    }
    
    /**
        set the begining module for the user
     */
    func beginModule(module_id:Int){
        
        //find the index for this module id
        if let index = self.modules.firstIndex(where: {$0.id == module_id})
        {
            currentModuleIndex = index
        }
        
        //set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(lessonIndex:Int){
        //find the lesson in the module
//        if let index = self.currentModule?.content.lessons.firstIndex(where: {$0.id == lesson_id})
//        {
//            currentModuleLessonIndex = index
//        }
//        
//        //set the current lesson
//        currentLesson = self.currentModule?.content.lessons[currentModuleLessonIndex]
        
        
        //check that lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count{
            currentModuleLessonIndex = lessonIndex
        }else{
            currentModuleLessonIndex = 0
        }
        
        //set the current lesson
        currentLesson = currentModule!.content.lessons[currentModuleLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nexLesson(){
        
        //advance the lesson
        currentModuleLessonIndex += 1
        
        //check if wthin range
        if currentModuleLessonIndex < currentModule!.content.lessons.count {
            //set the current lesson property
            currentLesson = currentModule!.content.lessons[currentModuleLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else
        {
            //Reset the lesson property state
            currentModuleLessonIndex = 0
            currentLesson = nil
            
        }
    }
    
    func hasNextLesson() -> Bool{
        return (currentModuleLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    
    //MARK: Code Styling
    private func addStyling(_ htmlStringL: String) -> NSAttributedString{
        var resultString = NSAttributedString()
        var data = Data()
        
        //add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
        //add the html data
        data.append(Data(htmlStringL.utf8))
        
        //convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            resultString = attributedString
        }
        
        return resultString
    }
        
    
}
