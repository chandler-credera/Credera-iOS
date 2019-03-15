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
    private let authToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImQ2ZDUzYzgyMzU0NzA5MjYyMjJkMWUyMDAyZDczNGU4NGVkM2JiODk1ZDdlODhjYzFjMzBlOTRjZGZjYTk4ZTczOWRjZDhkZjFjYjc2M2YzIn0.eyJhdWQiOiJaVWpXeDJDTW1hNUlQT0FCTXZIUUtJeDhGNFV1TThJVWF6aEhBbU5lVE9Tam9IaDJDTiIsImp0aSI6ImQ2ZDUzYzgyMzU0NzA5MjYyMjJkMWUyMDAyZDczNGU4NGVkM2JiODk1ZDdlODhjYzFjMzBlOTRjZGZjYTk4ZTczOWRjZDhkZjFjYjc2M2YzIiwiaWF0IjoxNTUyNjc2ODUxLCJuYmYiOjE1NTI2NzY4NTEsImV4cCI6MTU1MjY4MDQ1MSwic3ViIjoiIiwic2NvcGVzIjpbXX0.ya8huvoyQ14ABsw3KOBl6rl51wf8DcqlRL49nzZTQ7B5ncTSZpktdQ_lLAkkkPASLtjqaC8CXnVwdkh8DT_lWq1BOiNwi3z6CKHPNmY2GhgYaLgjorZ7mE3gtUgx0jIjSfGUHUrllLo5YWMwqhiMaM4RVzItGFRWy43HeqnYUrYWr3dgqs1AgTed58OyVpBFfb_uHlZm3tWcKMns_1d6MCRfKgvAE5nRTvUDlN1HOu2Rhen75QI9aZ-O8TcRUZvcVvwHW67oOf_HEIeMAzPdt1ISGRq3Ighf9_Eivgh8de8xfPaFb2k2I2z_AHGuT7l76zVzU1kc82r_pqKmtUwaTA"
    
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
        print(request)
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
