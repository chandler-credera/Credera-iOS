//
//  AnimalApiImpl.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

class AnimalApiImpl: AnimalApi {
    private let baseUrl: String = "https://api.petfinder.com/v2/animals"
    private let defaultPath: String = ""
    
    private let authHeader = "Authorization"
    private let authToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjEyZTNjY2VlZDQ0ODBiNTNlZWI2NWVlZDYzYjE1YmM4YmNmNzE5NWU3YjQyMjJjNThiOGMxNWEzOGUyZTE4YTFlZDViNjZkMzYwMzgxYzZjIn0.eyJhdWQiOiJaVWpXeDJDTW1hNUlQT0FCTXZIUUtJeDhGNFV1TThJVWF6aEhBbU5lVE9Tam9IaDJDTiIsImp0aSI6IjEyZTNjY2VlZDQ0ODBiNTNlZWI2NWVlZDYzYjE1YmM4YmNmNzE5NWU3YjQyMjJjNThiOGMxNWEzOGUyZTE4YTFlZDViNjZkMzYwMzgxYzZjIiwiaWF0IjoxNTUyNjgyMDQyLCJuYmYiOjE1NTI2ODIwNDIsImV4cCI6MTU1MjY4NTY0Miwic3ViIjoiIiwic2NvcGVzIjpbXX0.F1lhm6X5Y_e0JEBwTk6SlSxQ3B-yvpJ4VuUefXVaircWm05Sa6c77kq2HZ7_KwdGDNQEMMMWdi6I2OKZqm2G_9jjeS0JzP3RJ3ktDhozQphtpNRB_sUP4O4052KY9WXDmcJMe2bj65sJuYyNCfkSrNN6UP6LESVVRvzUeAkWuzIZwT3QbfwlDQ1r4rLtQl8LV-8pCAkFEpoBDBixw7QxzSleoFcpRdlfbxTkpnpg5tugdHlV9GP4H1EjrmbI1vTeMjZ3YsWPhhqDlB9BJ48cLa7p2pwAL8oNMv5cAvVhWl51O8k6E3q664a_ZsHWZ8Qg6_NlNMkp7sRDMxlDRV526g"
    
    private var caller: RequestCaller
    
    init(caller: RequestCaller) {
        self.caller = caller
    }
    
    func read() -> Promise<AnimalsApiModel> {
        let request = reqRead()
        let response: Promise<AnimalsApiModel> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func readById(id: Int) -> Promise<AnimalApiModel> {
        let request = reqRead(id: id)
        let response: Promise<AnimalApiModel> = caller.call(request.asURLRequest())
        
        return response
    }
    
    // region Request Helpers
    
    private func reqRead() -> HttpRequest {
        return HttpRequest(httpMethod: HttpMethod.get, path: defaultPath, baseUrl: baseUrl, query: nil, payload: nil, headers: [authHeader: authToken])
    }
    
    private func reqRead(id: Int) -> HttpRequest {
        return HttpRequest(httpMethod: HttpMethod.get, path: String(id), baseUrl: baseUrl, query: nil, payload: nil, headers: [authHeader: authToken])
    }
}
