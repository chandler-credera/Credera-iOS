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
    private let defaultPath: String = "?type=dog&limit=20&location=75001"
    
    private let authHeader = "Authorization"
    private var authToken = ""
    
    private let grantTypeKey = "grant_type"
    private let grantTypeValue = "client_credentials"
    
    private let clientIdKey = "client_id"
    private let clientIdValue = "ZUjWx2CMma5IPOABMvHQKIx8F4UuM8IUazhHAmNeTOSjoHh2CN"
    
    private let clientSecretKey = "client_secret"
    private let clientSecretValue = "QwHNH4EmT8nfcGyFAn6M40U45kMgWnQ4t2ut1pCx"
    
    private let tokenDefaultPath = ""
    private let tokenBaseURL = "https://api.petfinder.com/v2/oauth2/token"
    
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
    
    func  getToken() -> Promise<TokenApiModel> {
        let request = reqToken()
        let response: Promise<TokenApiModel> = caller.call(request.asURLRequest())
        
        return response
    }
    
    // region Request Helpers
    
    private func reqRead() -> HttpRequest {
        authToken = UserDefaults.standard.string(forKey: "bearerToken") ?? authToken
    
        return HttpRequest(httpMethod: HttpMethod.get, path: defaultPath, baseUrl: baseUrl, query: nil, payload: nil, headers: [authHeader: authToken])
    }
    
    private func reqRead(id: Int) -> HttpRequest {
        return HttpRequest(httpMethod: HttpMethod.get, path: String(id), baseUrl: baseUrl, query: nil, payload: nil, headers: [authHeader: authToken])
    }
    
    private func reqToken() -> HttpRequest {
        return HttpRequest(httpMethod: HttpMethod.post, path: tokenDefaultPath, baseUrl: tokenBaseURL, query: nil, payload: [grantTypeKey: grantTypeValue, clientIdKey: clientIdValue, clientSecretKey: clientSecretValue], headers: nil)
    }
}
