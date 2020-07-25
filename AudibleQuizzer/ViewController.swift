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

    struct Question {
        var uid: String
        var question: String
        var tags: [String]?
        var source: String?
    }

    struct QandA {
        var question: String
        var answer: String
        var tags: [String]?
        var source: String?
    }

    let qa01 = QandA(question: "What is app lifecycle for an iOS application?", answer: "An iOS app progresses through different states from launch to termination, and responds to system notifications differently depending on its state. These states are: inactive or background to active to inactive, then suspended to not running", tags: [], source: "Apple doc")
    let qa02 = QandA(question: "How do you pass information from one view controller to another?", answer: "One method of passing information from one view controller to another is with dependency injection, which can be done at initialization or with a property assignment. The parent view controller assigns values in the child view controller; this enforces loose coupling between parent and child", tags: nil, source: nil)
    let qa03 = QandA(question: "How do you define the run loop?", answer: "The run loop is a mechanism for managing and responding to events in an event-driven application. It is a process that continuously monitors for input events, and assigns each event that occurs to the appropriate target for processing.", tags: nil, source: nil)
    let qa04 = QandA(question: "Can you describe coding keys?", answer: "Coding keys are nested enumerations that can be declared in a Codeable type, to specify the properties that must be included when instances of the type are encoded or decoded.", tags: nil, source: nil)
    

    var currentQandA: QandA?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionsAndAnswers = [qa01, qa02, qa03, qa04]
        
        readNextQuestion(from: questionsAndAnswers)
//        if let currentQandA = currentQandA {
//            readAnswer(from: currentQandA)
//        }

    }

    func pickRandomQandA(from collection: [QandA]) -> QandA? {
        guard let randomQandA = collection.randomElement() else {
            return nil
        }
        return randomQandA
    }

    func readQuestion(from qAndA: QandA) {
        let utterance = AVSpeechUtterance(string: qAndA.question)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }

    func readAnswer(from qAndA: QandA) {
        let utterance = AVSpeechUtterance(string: qAndA.answer)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }

    func readNextQuestion(from collection: [QandA]) {
        guard let qAndA = pickRandomQandA(from: collection) else {
            return
        }
        
        currentQandA = qAndA
        readQuestion(from: qAndA)
    }








        





}

