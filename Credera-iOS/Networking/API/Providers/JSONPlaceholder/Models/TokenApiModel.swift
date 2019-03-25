//
//  TokenApiModel.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/19/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct TokenApiModel: Codable {
    let token_type: String?
    let expires_in: Int?
    let access_token: String?
}
