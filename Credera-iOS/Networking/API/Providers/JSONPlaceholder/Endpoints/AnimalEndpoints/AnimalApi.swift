//
//  AnimalApi.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol AnimalApi {
    func read() -> Promise<AnimalsApiModel>
    func readById(id: Int) -> Promise<AnimalApiModel>
    func getToken() -> Promise<TokenApiModel>
    
}
