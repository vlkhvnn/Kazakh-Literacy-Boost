//
//  User.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import Foundation

public struct User : Codable, Equatable {
    let id : String
    let name : String
    var currXP : Int
    var achievements : [String]
}


