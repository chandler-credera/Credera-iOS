//
//  NavigationIntermediateViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationIntermediateViewController: UIViewController, NavigationHelper {
    
    public class var storyboardName: String { return "NavigationIntermediate" }
    public class var viewControllerID: String { return "NavigationIntermediateViewController" }
    
    var passedInformation: String?
    weak var delegate: NavigationCompletedProtocol?
    
    var selectedAges: [String]?
    
    @IBOutlet weak var passedInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
//        let animalApi: AnimalApi = AnimalApiImpl(caller: RequestCaller())
//        let animalService: AnimalService = AnimalServiceImpl(animalApi: animalApi)
//
//        animalService.getAllAnimals().then { (animals) in
//            animals.animals.map({ (animal) in
//                print(animal.name)
//                print(animal.age)
//                print(animal.id)
//                print(animal.mainPhotoUrl)
//            })
//            }.catch { (error) in
//                // Handle error...
//                print(error)
//        }
    }
    
    public static func getInstance(passedInformation: String, selectedAges: [String], delegate: NavigationCompletedProtocol) -> UIViewController {
        guard let navigationIntermediateController = getInstance() as? NavigationIntermediateViewController else {
            return UIViewController()
        }
        
        navigationIntermediateController.passedInformation = passedInformation
        navigationIntermediateController.delegate = delegate
        navigationIntermediateController.selectedAges = selectedAges
        
        print(selectedAges)
        
        return navigationIntermediateController
    }
    
    // this function is where the string from the previous view sets the labels text on this view
    func setupUI() {
        passedInformationLabel.text = passedInformation
    }
    
    @IBAction func navToFinalScreenClicked(_ sender: Any) {
        if let passedString = passedInformation, let navigationCompletedDelegate = delegate {
            let navigationFinalVC = NavigationFinalViewController.getInstance(passedInformation: passedString, delegate: navigationCompletedDelegate)
            navigationController?.pushViewController(navigationFinalVC, animated: true)
        }
    }
    
}
