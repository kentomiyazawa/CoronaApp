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
    
    var applicableNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        applicableNumberLabel.text = "\(applicableNumber)個に該当"
    }
    

 

}
