//
//  TimeCounter.swift
//  RGBBullsEyeSwiftUI
//
//  Created by Eli Pacheco Hoyos on 5/07/20.
//  Copyright © 2020 Eli Pacheco Hoyos. All rights reserved.
//

import Foundation
import Combine

class TimerCounter: ObservableObject {
    var timer: Timer?
    @Published var counter: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateCounter() {
        counter += 1
    }
}
