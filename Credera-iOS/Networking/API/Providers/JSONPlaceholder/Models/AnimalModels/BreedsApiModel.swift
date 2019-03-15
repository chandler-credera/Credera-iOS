//
//  BreedsApiModel.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct BreedsApiModel: Codable {
    let primary: String?
    let secondary: String?
    let mixed: Bool?
    let unknown: Bool?
}
