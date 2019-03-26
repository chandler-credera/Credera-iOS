//
//  Token.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/25/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct Token {
    
    var token_type: String = ""
    var expires_in: Int = 3600
    var access_token: String = ""

    init() {}
}
