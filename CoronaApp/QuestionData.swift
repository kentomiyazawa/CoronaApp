//
//  QuestionData.swift
//  CoronaApp
//
//  Created by 宮沢建人 on 2020/07/01.
//  Copyright © 2020 miyazawa. All rights reserved.
//

import Foundation

class QuestionData {
    var question: String
    
    var applicableNumber: Int
    
    var userChoiceAnswerNumber: Int?
    
    var questionNo: Int = 0
    
    init(questionSource: [String]) {
        question = questionSource[0]
        applicableNumber = Int(questionSource[1])!
    }
    
    func isCorrect() -> Bool {
        if applicableNumber == userChoiceAnswerNumber {
            return true
        }
        return false
    }
}

class QuestionDataMannager {
    static let shareInstance = QuestionDataMannager()
    
    var questionDataArray = [QuestionData]()
    
    var nowQuestionIndex: Int = 0
    
    private init(){
        
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        
        nowQuestionIndex = 0
        
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("csvデータがありません")
            return
        }
        
        do{
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            
            csvStringData.enumerateLines(invoking: {(line, stop) in
                let questionSourceDataArray = line.components(separatedBy: ",")
                let questionData = QuestionData(questionSource: questionSourceDataArray)
                self.questionDataArray.append(questionData)
                questionData.questionNo = self.questionDataArray.count
            })
        }catch let error {
            print("csvファイルが読み込まれませんでした\(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
