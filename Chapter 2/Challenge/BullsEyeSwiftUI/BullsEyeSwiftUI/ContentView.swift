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
    var selectedNumber: CGFloat
    @State
    var showAlert: Bool = false
    var tolerance: Int
    var targetNumber: Int
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(targetNumber)")
            ProgressSlider(value: $selectedNumber)
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
        let result = selectedNumber * 100
        return Int(result)
    }
    
    var scoreMessage: String {
        let lowLimit = targetNumber - tolerance
        let upLimit = targetNumber + tolerance
        
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
    var body: some View {
        HStack {
            Text("1").padding([.leading], 20)
            Slider(value: $value)
            Text("100").padding([.trailing], 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedNumber: 0.5,
                    tolerance: 2,
                    targetNumber: Int.random(in: 1...100))
    }
}
