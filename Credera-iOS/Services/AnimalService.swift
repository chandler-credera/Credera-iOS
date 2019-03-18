//
//  AnimalService.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol AnimalService {
    func getAllAnimals() -> Promise<Animals>
    func getAnimalById(id: Int) -> Promise<Animal>
}