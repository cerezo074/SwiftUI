//
//  GameViewModel.swift
//  BullsEye
//
//  Created by Eli Pacheco Hoyos on 19/07/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var currentValue: Float = 50.0
    @Published var showAlert: Bool = false
    
    let targetValue = Int.random(in: 1...100)
    
    var score: Int {
        let difference = abs(targetValue - Int(currentValue))
        return 100 - difference
    }
    
    var hint: Float {
        return 1.0 - Float(score) / 100.0
    }
}
