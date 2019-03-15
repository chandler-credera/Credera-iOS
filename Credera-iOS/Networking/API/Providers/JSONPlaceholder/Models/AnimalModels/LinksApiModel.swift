//
//  LinksApiModel.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct LinksApiModel: Codable {
    let `self`: SelfApiModel?
    let type: TypeApiModel?
    let organization: OrganizationApiModel?
}
