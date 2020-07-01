//
//  StartViewController.swift
//  CoronaApp
//
//  Created by 宮沢建人 on 2020/07/01.
//  Copyright © 2020 miyazawa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataMannager.shareInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController else { return }
        
        
        guard let questionData = QuestionDataMannager.shareInstance.nextQuestion() else {return}
        nextViewController.questionData = questionData
    }
    
    @IBAction func goTitle(_ segue: UIStoryboardSegue){
        
    }
}
