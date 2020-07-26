//
//  Datastore.swift
//  AudibleQuizzer
//
//  Created by David Lawrence on 7/25/20.
//  Copyright © 2020 clarity for action. All rights reserved.
//

import Foundation

class Datastore {
    
    func getAllData() -> [QandA] {
        return questionsAndAnswersData
    }
    
    var questionsAndAnswersData = [
        QandA(question: "What is app lifecycle for an iOS application?", answer: "An iOS app progresses through different states from launch to termination, and responds to system notifications differently depending on its state. These states are: inactive or background to active to inactive, then suspended to not running", tags: [.intvCitibank202004, .iOS], source: "Apple doc"),
        QandA(question: "How do you pass information from one view controller to another?", answer: "One method of passing information from one view controller to another is with dependency injection, which can be done at initialization or with a property assignment. The parent view controller assigns values in the child view controller; this enforces loose coupling between parent and child", tags: [.intvCitibank202004, .iOS], source: nil),
        QandA(question: "How do you define the run loop?", answer: "The run loop is a mechanism for managing and responding to events in an event-driven application. It is a process that continuously monitors for input events, and assigns each event that occurs to the appropriate target for processing.", tags: [.intvCitibank202004, .iOS], source: nil),
        QandA(question: "Can you describe coding keys?", answer: "Coding keys are nested enumerations that can be declared in a Codeable type, to specify the properties that must be included when instances of the type are encoded or decoded.", tags: [.intvCitibank202004, .Swift], source: nil),
        QandA(question: "can you describe 'app pinning'?", answer: "App pinning, also known as SSL pinning, is a technique for making mobile apps more secure, even when users use unsecure wireless networks. The target server's SSL certificate or public key is saved in the app bundle. The app can then use this to verify the certificate or key it recieves from the server; if they do not match, the app can terminate the connection. This helps prevent man-in-the-middle attacks by ensuring that the app only communicates with the intended server.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "What are the essential components of a secure session between a client and a server?", answer: "When a client such as a web browser or mobile app begins a secure session with a server, the client and server must agree on three things: how public keys will be exchanged, how data will be encrypted, and how messages will be marked as authentic. This could be done for instance with RSA, AES256, and SHA1. If the client can support these protocols, the client requests a certificate chain from the server and extracts the public key from the certificate.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "You say that you have used NSURLSession. Let’s say that you are using NSURLSession in an iOS app, to download data, but the download fails in progress due to a network error. How would you handle that?", answer: "answer to be provided", tags: [.intvCitibank202004], source: nil),
        QandA(question: "You say that you have used NSURLSession. Let’s say that you are using NSURLSession in an iOS app to query a URL, but the server responds with a request for a username and password. What do you do?", answer: "answer to be provided", tags: [.intvCitibank202004], source: nil),
        QandA(question: "You say that you have used Core Data. Did you use it in a single-threaded or multi-threaded environment?", answer: "Apple has built Core Data for multi-threaded applications, but I have used Core Data on the main thread only, because the amount of data retrieved was small, and no network requests or other time-consuming processes were involved.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "Let’s assume that you have an app with a welcome screen that has a get started button, but I only want to see the screen once, not each time the app is loaded after that. How would you do that?", answer: "You could do this by setting a persistent flag, such as in user defaults; this would register if the app has been launched. When the welcome screen view controller loads, it would check the flag state and only finish loading the screen if the flag is false or nil, and then it would set the flag to true.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "Can you describe the access modifiers in Swift?", answer: "There are five Swift access levels: these are used to allow or restrict access to parts of code, also called entities, in an application. The access levels are: open, public, internal, file private, and private. More details to be added.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "OK, so for example, let’s say I have one file that contains two classes, class A and class B; Class A is private and has a variable marked ‘var private something …’. Can Class B access the ‘something’ variable?", answer: "No, because the 'private' access level restricts the use of an entity to its enclosing declaration.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "OK, so for example, let’s say I have one file that contains two classes, class A and class B; Class A is file private and has a variable marked ‘var private something …’. ; can Class B access the ‘something’ variable? ", answer: "No, because even though class A is 'file private' which provides access to its itself to other code in the same file, its variable is marked as 'private', and so is restricted to use by class A, which is the enclosing declaration.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "Can you compare GCD and NSOperationQueue?, and why would you use one versus the other?", answer: "GCD, or Grand Central Dispatch, now formally called Dispatch, is Apple's framework for managing concurrent code execution on multicore hardware on all OS's. It is a low-level C framework that manages asynchronous process and is lightweight to use to execute single tasks by passing a block or closure. In contrast, NSOperationQueue is a higher-level Objective-C framework built on GCD. It is slower but offers more features for handling operations consisting of multiple related tasks, and for managing dependencies between tasks.", tags: [.intvCitibank202004], source: nil),
        QandA(question: "What is XPC and how would you use it in an iOS app?", answer: "XPC is a Foundation framework for managing secure interprocess communication. Apple uses XPC internally, but it is not available for use by third-party developers for iOS apps", tags: nil, source: nil),
        
    ]
    

    
}
