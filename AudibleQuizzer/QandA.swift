//
//  QandA.swift
//  AudibleQuizzer
//
//  Created by David Lawrence on 7/25/20.
//  Copyright © 2020 clarity for action. All rights reserved.
//

import Foundation

struct QandA: Equatable, Hashable {
    var question: String
    var answer: String
    var tags: [Tag]?
    var source: String?
}
