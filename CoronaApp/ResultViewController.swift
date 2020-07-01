//
//  ResultViewController.swift
//  CoronaApp
//
//  Created by 宮沢建人 on 2020/07/01.
//  Copyright © 2020 miyazawa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var applicableNumberLabel: UILabel!
    
    @IBOutlet weak var showConditionLabel: UILabel!
    var applicableNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var applicableNumber: Int = 0
        for questionData in
            QuestionDataMannager.shareInstance.questionDataArray {
                if questionData.isCorrect() {
                    applicableNumber += 1
                }
        }
        applicableNumberLabel.text = "\(applicableNumber)個該当しました"
        showCondition(applicableNumber: applicableNumber)
    }
    
    func showCondition(applicableNumber: Int) {
        if applicableNumber >= 8 {
            showConditionLabel.text = "コロナの疑いあり!"
        } else if applicableNumber >= 6 {
            showConditionLabel.text = "コロナの可能性 大"
        } else if applicableNumber >= 4 {
            showConditionLabel.text = "コロナの可能性 中"
        } else {
            showConditionLabel.text = "コロナの可能性 小"
        }
    }
    
}
