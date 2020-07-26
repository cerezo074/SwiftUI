//
//  User.swift
//  Kuchi
//
//  Created by Eli Pacheco Hoyos on 26/07/20.
//  Copyright © 2020 Omnijar. All rights reserved.
//

import Foundation
import Combine

final internal class User {
    
    @Published var isRegistered: Bool = false
    private let willChange = PassthroughSubject<User, Never>()

    var profile: Profile = Profile() {
        willSet {
            willChange.send(self)
        }
    }

    
    init(name: String) {
        self.profile.name = name
    }
    
    init() {
        
    }
}
