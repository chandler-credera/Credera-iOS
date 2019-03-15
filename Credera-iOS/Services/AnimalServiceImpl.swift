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
        
        let apiResponse: Promise<AnimalsApiModel> = animalApi.read()
        return apiResponse.then { (apiAnimals) -> Animals in
            var animals = Animals()
            
            let animalsArr: [AnimalApiModel] = apiAnimals.animals ?? []
            
            let mapped = animalsArr.map({ (apiAnimal) -> Animal in
                var animal = Animal()
                
                animal.id = apiAnimal.id ?? -1
                animal.name = apiAnimal.name ?? ""
                animal.mainPhotoUrl = apiAnimal.photos?.first?.small ?? ""
                
                return animal
            })
            
            animals.animals = mapped
            return animals
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
