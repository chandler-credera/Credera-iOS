//
//  Animal.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct Animal {
    var id: Int = -1
    var organization_id: String = ""
    var url: String = ""
    var type: String = ""
    var species: String = ""
    var age: String = ""
    var gender: String = ""
    var size: String = ""
    var coat: String = ""
    var tags: [String] = []
    var name: String = ""
    var description: String = ""
    var mainPhotoUrl: String = ""
    var status: String = ""
    var published_at: String = ""
    
    init() {}
}
