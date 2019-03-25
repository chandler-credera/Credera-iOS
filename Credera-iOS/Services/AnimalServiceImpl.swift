//
//  AnimalServiceImpl.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/15/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

class AnimalServiceImpl: AnimalService {
    
    let animalApi: AnimalApi
    
    init(animalApi: AnimalApi) {
        self.animalApi = animalApi
    }
    
    func getAllAnimals() -> Promise<Animals> {
        
        let tokenExpiration = UserDefaults.standard.object(forKey: "tokenExpiration") as? Date ?? Date()
        
        if Date() > tokenExpiration {
            getBearerToken()
        }
        
        let apiResponse: Promise<AnimalsApiModel> = animalApi.read()
       
        return apiResponse.then { (apiAnimals) -> Animals in
            var animals = Animals()
            
            let animalsArr: [AnimalApiModel] = apiAnimals.animals ?? []
            
            let mapped = animalsArr.map({ (apiAnimal) -> Animal in
                var animal = Animal()
                
                animal.id = apiAnimal.id ?? -1
                animal.name = apiAnimal.name ?? ""
                animal.mainPhotoUrl = apiAnimal.photos?.first?.full ?? ""
                animal.description = apiAnimal.description ?? ""
                animal.age = apiAnimal.age ?? ""
                animal.gender = apiAnimal.gender ?? ""
                
                if let animalURL = URL(string: apiAnimal.photos?.first?.full ?? "") {
                    if let data = try? Data(contentsOf: animalURL) {
                        if let animalImage = UIImage(data: data) {
                            animal.mainImage = animalImage
                        }
                    }
                }
                
                return animal
            })
            
            animals.animals = mapped
            return animals
        }
    }

    func getBearerToken() {
        let apiResponse: Promise<TokenApiModel> = animalApi.getToken()
        
        apiResponse.then { (token) in
            let bearerToken = "Bearer " + (token.access_token ?? "")
            let tokenExpiration = Date().addingTimeInterval(3600)
            UserDefaults.standard.set(bearerToken, forKey: "bearerToken")
            UserDefaults.standard.set(tokenExpiration, forKey: "tokenExpiration")
        }
    }
    
    // this one needs to be changed later because it sends
    func getAnimalById(id: Int) -> Promise<Animal> {
        let apiResponse: Promise<AnimalApiModel> = animalApi.readById(id: id)
        
         return apiResponse.then { (apiAnimal) in
            var animal = Animal()
            
            animal.name = apiAnimal.name ?? "no name"
            
            return Promise({ () -> Animal in
                return animal
                
            })
        }
    }
}
