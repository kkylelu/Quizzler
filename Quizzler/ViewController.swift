//
//  ViewController.swift
//  Quizzler
//
//  Created by 呂建鎧 on 2023/10/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    

    // 題庫
    let quiz = [
        Question(text: "太陽從東邊升起", answer: "正確"),
        Question(text: "鯊魚是哺乳類動物", answer: "錯誤"),
        Question(text: "哆啦a夢最愛吃大阪燒", answer: "錯誤")
        
    ]
    
    var questionNumber = 0
    
    // 在這裡的 code 在首次開啟 APP 時運行。
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0 //自動調整高度顯示多行文字
        updateUI()
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // 正確,錯誤
        let actualAnswer = quiz[questionNumber].answer//題庫的「答案」位置
        
        if userAnswer == actualAnswer{
            print("Right!")
        }else{
            print("Wrong!")
        }
        
        // 避免題庫不夠導致 APP 閃退
        if questionNumber + 1 < quiz.count{ // 題庫共 3 題，如果questionNumber不+1，來到第 2 題，就會通過判斷式，跑到 updateUI，導致閃退。
            questionNumber += 1
        }else{
            questionNumber = 0 //只要題庫用完，就歸零重來
            
        }
        
        updateUI()
        
    }
    
    // 設定 update UI func 讓它在首次運行和每次按按鈕時都能被調用。
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text // 題庫的「問題」位置
        
    }
    

}

