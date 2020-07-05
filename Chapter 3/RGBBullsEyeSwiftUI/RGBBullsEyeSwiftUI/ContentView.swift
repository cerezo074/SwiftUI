//
//  ContentView.swift
//  RGBBullsEyeSwiftUI
//
//  Created by Eli Pacheco Hoyos on 28/06/20.
//  Copyright © 2020 Eli Pacheco Hoyos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        self.showAlert ? Text("R: \(Int(rTarget * 255.0))"
                          + "  G: \(Int(gTarget * 255.0))"
                          + "  B: \(Int(bTarget * 255.0))")
                          : Text("Match this color")
                    }
                    VStack {
                        ZStack(alignment: .center) {
                            Color(red: rGuess, green: gGuess, blue: bGuess)
                            Text("60")
                                .padding(.all, 5)
                                .background(Color.white)
                                .mask(Circle())
                        }
                        Text("R: \(Int(rGuess * 255.0))"
                            + " G: \(Int(gGuess * 255.0))"
                            + " B: \(Int(bGuess * 255.0))")
                    }
                }
                Button(action: { self.showAlert = true }) {
                    Text("Hit me")
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Your score"), message: Text(String(computeScore())))
                }.padding()
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }.padding(.horizontal)
            }
            .navigationBarTitle("Color Match", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
                .cornerRadius(10)
                .background(textColor)
            Text("255").foregroundColor(textColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            .previewLayout(.fixed(width: 568, height: 380))
            .environment(\.colorScheme, .dark)
    }
}
