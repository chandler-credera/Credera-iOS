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
    private let defaultPath: String = ""
    
    private let authHeader = "Authorization"
    private let authToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc1M2JkODYxNzJlNjEyNjA3MzMwN2Q0MWVhZGJhMDk4ZGFjMmJkNTM3NGQwODExYmUyODVmYmQ1MTYxMjVlMjg5MmU3NjRjY2YxMjYxZTExIn0.eyJhdWQiOiJaVWpXeDJDTW1hNUlQT0FCTXZIUUtJeDhGNFV1TThJVWF6aEhBbU5lVE9Tam9IaDJDTiIsImp0aSI6Ijc1M2JkODYxNzJlNjEyNjA3MzMwN2Q0MWVhZGJhMDk4ZGFjMmJkNTM3NGQwODExYmUyODVmYmQ1MTYxMjVlMjg5MmU3NjRjY2YxMjYxZTExIiwiaWF0IjoxNTUyOTQ0NzI5LCJuYmYiOjE1NTI5NDQ3MjksImV4cCI6MTU1Mjk0ODMyOSwic3ViIjoiIiwic2NvcGVzIjpbXX0.uMP0dnNvwzvWQU4JeLNqnu2lUGG4fSMlLQXzHX4e9k4jltfCrVX1rRpIMABjZwTRVjkmHxIvV6kD3JQahWmAqW4ETNypsI6BNQp2ciREyUFFlbHG5DcYPzZ5wiIT2qiO5Gv_LEyLB7UcSydsdjijZpJQ00Lrj7jSw9TdpL-Mbf0hosktfPMd0RcOKauE8tEXWIUWtkBGTOO1yjwwQMnVCF2MrWzGlbqpgfzXnnXhjkMNfW2mkkZFfEhZycVvza8mped6eoeGhy-m4CROs0exQE2tSFnSGmwpIupXE5N2nK13-n_aHW4gARNUt4BKSLN6NyuZwxQL-G4DR4lANMhT-w"
    
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
