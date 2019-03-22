//
//  AnimalProfileViewController.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/19/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class AnimalProfileViewController: UIViewController, NavigationHelper {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalAgeLabel: UILabel!
    @IBOutlet weak var animalGenderLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    public class var storyboardName: String { return "AnimalProfile" }
    public class var viewControllerID: String { return "AnimalProfileViewController" }
    
    weak var delegate: NavigationCompletedProtocol?
    
    var selectedAnimal: Animal = Animal()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Selected Animal: ", selectedAnimal.name)
        print(selectedAnimal.description)
        animalNameLabel.text = selectedAnimal.name
        animalDescriptionLabel.text = selectedAnimal.description
        animalAgeLabel.text = selectedAnimal.age
        animalGenderLabel.text = selectedAnimal.gender
        animalImage.image = selectedAnimal.mainImage
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    public static func getInstance(delegate: NavigationCompletedProtocol, animal: Animal) -> UIViewController {
        guard let animalProfileController = getInstance() as? AnimalProfileViewController else {
            return UIViewController()
        }
        
        animalProfileController.delegate = delegate
        animalProfileController.selectedAnimal = animal
        
        return animalProfileController
    }
    
    // MARK: Actions
    @IBAction func saveToFavorites(_ sender: UIBarButtonItem) {
        delegate?.addAnimalToFavorites(animal: selectedAnimal)
        navigationController?.popToRootViewController(animated: true)
    }
}
