//
//  ViewController.swift
//  Quizzler
//
//  Created by 呂建鎧 on 2023/10/9.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    

    var quizBrain = QuizBrain() //呼叫題庫
    
    
    
    // 在這裡的 code 在首次開啟 APP 時運行。
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0 //自動調整高度顯示多行文字
        updateUI()
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // 正確,錯誤
        let userGotItRight = quizBrain.checkAnswer(userAnswer)//題庫的「答案」位置
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        // 避免題庫不夠導致 APP 閃退
        quizBrain.nextQuestion()
        
        //利用時間延遲，才能觀察到按按鈕後的顏色變化
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    // 設定 update UI func 讓它在首次運行和每次按按鈕時都能被調用。
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText() // 題庫的「問題」位置
        // 更新進度條
        progressBar.progress = quizBrain.getProgress() // 隨答題顯示進度，由於計算從 0 開始， 0 / 0 = 0，會跑不滿進度條，所以要在 questionNumber + 1 ，讓數字被整除，才會完整顯示進度條
        
        
        trueButton.backgroundColor = UIColor.clear //重設按下按鈕後的顏色
        falseButton.backgroundColor = UIColor.clear

        
        scoreLabel.text = "答對題數: \(quizBrain.getScore())"
        
    }
    

}

