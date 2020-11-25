//
//  User.swift
//  Kuchi
//
//  Created by Eli Pacheco on 24/11/20.
//  Copyright © 2020 Omnijar. All rights reserved.
//

import Foundation
import Combine

final internal class User {
    
    @Published var isRegistered: Bool = false
    let willChange = PassthroughSubject<User, Never>()
    
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
