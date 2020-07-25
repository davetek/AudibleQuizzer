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

    struct QandA: Equatable, Hashable {
        var question: String
        var answer: String
        var tags: [Tag]?
        var source: String?
    }
    
    enum Tag {
        case intvCitibank202004
        case iOS
        case ObjC
        case Swift
        case UIKit
    }


    let qa01 = QandA(question: "What is app lifecycle for an iOS application?", answer: "An iOS app progresses through different states from launch to termination, and responds to system notifications differently depending on its state. These states are: inactive or background to active to inactive, then suspended to not running", tags: [.intvCitibank202004, .iOS], source: "Apple doc")
    let qa02 = QandA(question: "How do you pass information from one view controller to another?", answer: "One method of passing information from one view controller to another is with dependency injection, which can be done at initialization or with a property assignment. The parent view controller assigns values in the child view controller; this enforces loose coupling between parent and child", tags: [.intvCitibank202004, .iOS], source: nil)
    let qa03 = QandA(question: "How do you define the run loop?", answer: "The run loop is a mechanism for managing and responding to events in an event-driven application. It is a process that continuously monitors for input events, and assigns each event that occurs to the appropriate target for processing.", tags: [.intvCitibank202004, .iOS], source: nil)
    let qa04 = QandA(question: "Can you describe coding keys?", answer: "Coding keys are nested enumerations that can be declared in a Codeable type, to specify the properties that must be included when instances of the type are encoded or decoded.", tags: [.intvCitibank202004, .Swift], source: nil)
    let qa05 = QandA(question: "can you describe 'app pinning'?", answer: "App pinning, also known as SSL pinning, is a technique for making mobile apps more secure, even when users use unsecure wireless networks. The target server's SSL certificate is saved in the app bundle. This helps prevent man-in-the-middle attacks by ensuring that the app only communicates with the intended server.", tags: [.intvCitibank202004], source: nil)
    
    var questionsAndAnswers = [QandA]()
    var currentQuestionsAndAnswers = Set<QandA>()
    var currentQandA: QandA?
    
    @IBOutlet weak var questionButton: UIButton!
    @IBAction func askQuestion(_ sender: UIButton) {
        guard let qAndA = pickRandomQandA(from: questionsAndAnswers) else {
            return
        }

        currentQandA = qAndA
        readQuestion(from: qAndA)
    }
    
    
    @IBOutlet weak var answerButton: UIButton!
    @IBAction func sayAnswer(_ sender: UIButton) {
        guard let qAndA = currentQandA else {
            return
        }
        readAnswer(from: qAndA)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionsAndAnswers = [qa01, qa02, qa03, qa04, qa05]
    }

    func pickRandomQandA(from collection: [QandA]) -> QandA? {
        //monitor the set of questions already asked; if all have been
        // asked, clear the set to start over
        if currentQuestionsAndAnswers.count == collection.count {
            currentQuestionsAndAnswers.removeAll()
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










        





}

