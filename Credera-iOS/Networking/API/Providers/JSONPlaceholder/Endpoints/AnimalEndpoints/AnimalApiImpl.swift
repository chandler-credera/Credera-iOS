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
    private let baseUrl: String = ApiProviderConfig.petfinderBaseUrl
    private let defaultPath: String = "?type=dog"
    
    private let authHeader = "Authorization"
    private let authToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjkyMTlmZDdjNjNmNGFhNTljOGI3NGNiMjY0NWYyOWQyYTJhYWNmMzJmOTljYzI0YWU5ODhiNWQzNTkzMmU5MTdhZDc4MmE2MTFjNTczYTQ2In0.eyJhdWQiOiJaVWpXeDJDTW1hNUlQT0FCTXZIUUtJeDhGNFV1TThJVWF6aEhBbU5lVE9Tam9IaDJDTiIsImp0aSI6IjkyMTlmZDdjNjNmNGFhNTljOGI3NGNiMjY0NWYyOWQyYTJhYWNmMzJmOTljYzI0YWU5ODhiNWQzNTkzMmU5MTdhZDc4MmE2MTFjNTczYTQ2IiwiaWF0IjoxNTUzMDA4NTAxLCJuYmYiOjE1NTMwMDg1MDEsImV4cCI6MTU1MzAxMjEwMSwic3ViIjoiIiwic2NvcGVzIjpbXX0.t159VhlgSM9EYMXOglOf-RT5ypS6MdWPm7uRDu0ZAebNBry-pO6l1DleEs_p6Puv4Dv1Tksr3EiSFrcTj2RB9dyXwYQsZI6bs6DYHC4Zba5FoBhp0T8yKL-FgjZAjrcdfS526IfKuUorQv-GGM1xi5JHOujCNCRAxgqW-wn-GESJEvNy-jnUquQQBwAUKSbz1K77HqGw1QaY-GQaaXO52Kb-r1d72TADI-zeezYw1lMcHbiesG621Xq-xpQEK7wS0fQHHEBf45P2LTgt3f8aMMFdAlXE1AoV3sidK_Yr4vmey_8CyIxz_wbZdRnZndEd_D7JmGl4eb0tmEgIRKhAjA"
    
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
