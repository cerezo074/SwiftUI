//
//  HintSlider.swift
//  BullsEye
//
//  Created by Eli Pacheco Hoyos on 19/07/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation
import SwiftUI

struct HintSlider: UIViewRepresentable {
  
    @Binding var value: Float
    let hint: Float
    
    private var thumbColor: UIColor {
        return UIColor.blue.withAlphaComponent(CGFloat(hint))
    }
    
    func makeCoordinator() -> HintSlider.Coordinator {
        return Coordinator(value: $value)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.value = value / 100
        slider.thumbTintColor = thumbColor
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(slider:)),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value / 100
        uiView.thumbTintColor = thumbColor
        print(value)
    }
    
    class Coordinator: NSObject {
        var value: Binding<Float>
        
        init(value: Binding<Float>) {
            self.value = value
        }
        
        @objc func valueChanged(slider: UISlider) {
            value.wrappedValue = slider.value * 100
        }
    }
}

struct HintSlider_Preview: PreviewProvider {
    static var previews: some View {
        HintSlider(value: .constant(80), hint: 0.15)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
