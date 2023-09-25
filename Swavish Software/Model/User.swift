//
//  User.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
//    When they joined our app
    let joined: TimeInterval
//    let profilePhotoURL: String
    
    
}


