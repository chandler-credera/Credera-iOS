//
//  ContactApiModel.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct ContactApiModel: Codable {
    let email: String?
    let phone: String?
    let address: AnimalAddressApiModel?
}
