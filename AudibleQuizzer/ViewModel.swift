//
//  ViewModel.swift
//  AudibleQuizzer
//
//  Created by David Lawrence on 7/25/20.
//  Copyright © 2020 clarity for action. All rights reserved.
//

import Foundation

class ViewModel {
    
    var datastore = Datastore()
        
    func getListOfQuestions() -> [QandA] {
        return datastore.getAllData()
    }
}
