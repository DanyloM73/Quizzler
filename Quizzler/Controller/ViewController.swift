//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    var timer: Timer?
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in self.updateUI() }
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        answerButton1.backgroundColor = UIColor.clear
        answerButton2.backgroundColor = UIColor.clear
        answerButton3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        answerButton1.setTitle(quizBrain.getAnswers()[0], for: .normal)
        answerButton2.setTitle(quizBrain.getAnswers()[1], for: .normal)
        answerButton3.setTitle(quizBrain.getAnswers()[2], for: .normal)
    }
    
}
