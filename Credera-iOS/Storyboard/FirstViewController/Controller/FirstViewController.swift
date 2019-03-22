//
//  FirstViewController.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 1/2/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit
import Promises

public protocol NavigationCompletedProtocol: class {
    func addAnimalToFavorites(animal: Animal)
}

class FirstViewController: UIViewController {
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    var favoriteAnimal: Animal = Animal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = AppHeaderView()

        let defaultName = UserDefaults.standard.object(forKey: "favoriteAnimalName") as? String ?? favoriteAnimal.name
        let defaultImageURL = UserDefaults.standard.object(forKey: "favoriteAnimalImage") as? String ?? ""
        
        if !defaultImageURL.isEmpty {
            if let animalURL = URL(string: defaultImageURL) {
                if let data = try? Data(contentsOf: animalURL) {
                    if let animalImage = UIImage(data: data) {
                        self.animalImage.image = animalImage
                    }
                }
            }
        } else {
            animalImage.image = favoriteAnimal.mainImage
        }
        
        animalNameLabel.text = defaultName
        
    }
    
    // MARK: Actions
    
    @IBAction func navigationExampleButtonClicked(_ sender: Any) {
        let animalCollectionScreen = AnimalCollectionViewController.getInstance(delegate: self)
        navigationController?.pushViewController(animalCollectionScreen, animated: true)
    }
}

extension FirstViewController: NavigationCompletedProtocol {
    func addAnimalToFavorites(animal: Animal) {
        favoriteAnimal = animal
        
        // set the user defualt to hold this new value
        UserDefaults.standard.set(animal.name, forKey: "favoriteAnimalName")
        UserDefaults.standard.set(animal.mainPhotoUrl, forKey: "favoriteAnimalImage")
        viewDidLoad()
    }
}
