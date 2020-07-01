//
//  QuestionViewController.swift
//  CoronaApp
//
//  Created by 宮沢建人 on 2020/07/01.
//  Copyright © 2020 miyazawa. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var questionData: QuestionData!
    
    @IBOutlet weak var questionNolLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionNolLabel.text = "Question\(questionData.questionNo)"
        questionTextView.text = questionData.question
    }
    

    @IBAction func tapYesButton(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestion()
    }
    
    @IBAction func tapNoButton(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 0
        goNextQuestion()
    }
    
    func goNextQuestion() {
        guard let nextQuestion = QuestionDataMannager.shareInstance.nextQuestion() else {
            if let resultViewController = storyboard?.instantiateViewController(identifier: "result") as? ResultViewController {
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
        
        if let nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextQuestionViewController.questionData = nextQuestion
            present(nextQuestionViewController, animated: true, completion: nil)
        }
    }
    
}
