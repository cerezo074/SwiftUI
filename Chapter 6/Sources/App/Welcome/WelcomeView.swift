//
//  WelcomeView.swift
//  Kuchi
//
//  Created by Eli Pacheco Hoyos on 25/07/20.
//  Copyright © 2020 Omnijar. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        return ZStack {
            Image("welcome-background", bundle: nil)
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.08)
            HStack {
                Image(systemName: "table")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .border(Color.gray, width: 1)
                    .cornerRadius(60 / 2)
                    .background(Color(white: 0.9))
                    .clipShape(Circle())
                    .foregroundColor(.red)
                VStack {
                    Text("Welcome to Kuchi")
                        .font(.headline)
                        .bold()
                    Text("Kuchi")
                        .font(.largeTitle)
                        .bold()
                }.foregroundColor(.red)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
