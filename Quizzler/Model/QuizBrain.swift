//
//  QuizBrain.swift
//  Quizzler
//
//  Created by 呂建鎧 on 2023/10/15.
//

import Foundation

struct QuizBrain{
    
    // 題庫
    let quiz = [
        Question(text: "太陽從東邊升起", answer: "正確"),
        Question(text: "鯊魚是哺乳類動物", answer: "錯誤"),
        Question(text: "哆啦a夢最愛吃大阪燒", answer: "錯誤")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer{
            score += 1
            return true //用戶答對了
        } else {
            return false //用戶答錯了
        }
        
    }
    
    func getScore() -> Int {
        return score
        
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text 
        
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float (quiz.count)
        return progress
    }
    
    
    // 避免題庫不夠導致 APP 閃退
    mutating func nextQuestion(){
        
        if questionNumber + 1 < quiz.count{ // 題庫共 3 題，如果questionNumber不+1，來到第 2 題，就會通過判斷式，跑到 updateUI，導致閃退。
            questionNumber += 1
        }else{
            questionNumber = 0 //只要題庫用完，就歸零重來
            score = 0 //讓分數歸零
            
        }
    }
    
    
}
