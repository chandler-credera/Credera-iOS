//
//  AttributesApiModel.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct AttributesApiModel: Codable {
    let spayed_neutered: Bool?
    let house_trained: Bool?
    let declawed: Bool?
    let special_needs: Bool?
    let shots_current: Bool?
}
