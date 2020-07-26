//
//  ViewController.swift
//  AudibleQuizzer
//
//  Created by David Lawrence on 7/25/20.
//  Copyright © 2020 clarity for action. All rights reserved.
//

// simple Swift or Objective-C single-view app
// one screen with two buttons: Question and Answer
// when the user taps the Question button, the readNextQuestion(from:) function is executed
// when the user taps the Answer button, the readAnswer(from:) function is executed, and the answer matching the current question is read

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    var synthesizer: AVSpeechSynthesizer?
    
    var questionsAndAnswers = [QandA]()
    var currentQuestionsAndAnswers = Set<QandA>()
    var currentQandA: QandA?
    
    @IBOutlet weak var questionButton: UIButton!
    @IBAction func askQuestion(_ sender: UIButton) {
        guard let qAndA = pickRandomQandA(from: questionsAndAnswers) else {
            return
        }
        currentQandA = qAndA
        readQuestion(from: qAndA, withSynthesizer: synthesizer)
    }
    
    @IBOutlet weak var answerButton: UIButton!
    @IBAction func sayAnswer(_ sender: UIButton) {
        guard let qAndA = currentQandA else {
            return
        }
        readAnswer(from: qAndA, withSynthesizer: synthesizer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        synthesizer = AVSpeechSynthesizer()
        questionsAndAnswers = viewModel.getListOfQuestions()
    }
    
    func informStartingOver(withSynthesizer speechSynthesizer: AVSpeechSynthesizer?) {
        guard let synthesizer = speechSynthesizer else {
            return
        }
        let utterance = AVSpeechUtterance(string: "I have read all the questions. Starting over now.")
        synthesizer.speak(utterance)
    }

    func pickRandomQandA(from collection: [QandA]) -> QandA? {
        //monitor the set of questions already asked; if all have been
        // asked, clear the set to start over
        if currentQuestionsAndAnswers.count == collection.count {
            currentQuestionsAndAnswers.removeAll()
            informStartingOver(withSynthesizer: synthesizer)
        }
        guard let randomQandA = collection.randomElement() else {
            return nil
        }
        //if the question was already asked in this cycle, skip it
        // if not, add the question & answer to the set of q&a already used
        if currentQuestionsAndAnswers.contains(randomQandA) {
            return pickRandomQandA(from: collection)
        } else {
            currentQuestionsAndAnswers.insert(randomQandA)
            return randomQandA
        }
        
    }

    func readQuestion(from qAndA: QandA, withSynthesizer speechSynthesizer: AVSpeechSynthesizer?) {
        guard let synthesizer = speechSynthesizer else {
            return
        }
        let utterance = AVSpeechUtterance(string: qAndA.question)
        synthesizer.speak(utterance)
    }

    func readAnswer(from qAndA: QandA, withSynthesizer speechSynthesizer: AVSpeechSynthesizer?) {
        guard let synthesizer = speechSynthesizer else {
            return
        }
        let utterance = AVSpeechUtterance(string: qAndA.answer)
        synthesizer.speak(utterance)
    }
    










        





}

