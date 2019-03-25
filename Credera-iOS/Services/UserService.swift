//
//  UserService.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol UserService {
    func create() -> Promise<User>
    func getAllUsers() -> Promise<[User]>
    func getUserByUsername(username: String) -> Promise<User>
    func getUserByEmail(email: String) -> Promise<User>
    func update(userId: Int) -> Promise<User>
    func delete(userId: Int) -> Promise<User>
}
