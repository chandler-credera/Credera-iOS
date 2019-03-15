//
//  Animal.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct AnimalApiModel: Codable {
    let id: Int?
    let organization_id: String?
    let url: String?
    let type: String?
    let species: String?
    let breeds: BreedsApiModel?
    let colors: ColorsApiModel?
    let age: String?
    let gender: String?
    let size: String?
    let coat: String?
    let attributes: AttributesApiModel?
    let enviroment: EnvironmentApiModel?
    let tags: [String]?
    let name: String?
    let description: String?
    let photos: [PhotosApiModel]?
    let status: String?
    let published_at: String?
    let contact: ContactApiModel?
    let _links: LinksApiModel?
}
