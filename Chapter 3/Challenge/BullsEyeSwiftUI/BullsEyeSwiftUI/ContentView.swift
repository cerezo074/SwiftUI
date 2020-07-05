//
//  ContentView.swift
//  BullsEyeSwiftUI
//
//  Created by Eli Pacheco Hoyos on 4/07/20.
//  Copyright © 2020 Eli Pacheco Hoyos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State
    var showAlert: Bool = false
    @State
    var current: CGFloat
    var target: Int
    var tolerance: Int

    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(target)")
            ProgressSlider(value: $current, target: target)
            Button(action: { self.showAlert = true  }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your score"), message: Text(scoreMessage))
            }
            Spacer().frame(maxHeight: .infinity)
        }.padding(.top, 20)
    }
}

private extension ContentView {

    var score: Int {
        let result = current * 100
        return Int(result)
    }
    
    var scoreMessage: String {
        let lowLimit = target - tolerance
        let upLimit = target + tolerance
        
        switch score {
        case lowLimit...upLimit:
            return "You got it!, you've got \(score)"
        default:
            return "Try again, your score \(score)"
        }
    }
    
}

struct ProgressSlider: View {
    @Binding var value: CGFloat
    var target: Int
    var body: some View {
        HStack {
            Text("1").padding([.leading], 20)
            Slider(value: $value)
                .background(Color.blue)
                .opacity(hintColor)
            Text("100").padding([.trailing], 20)
        }
    }
    
    var hintColor: Double {
        let valueNumber = Int(value * 100)
        let opacity: Double = Double(valueNumber) / Double(target)
        return opacity <= 1 ? 1 - opacity : 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(current: 0.5,
                    target: Int.random(in: 1...100),
                    tolerance: 2)
    }
}
