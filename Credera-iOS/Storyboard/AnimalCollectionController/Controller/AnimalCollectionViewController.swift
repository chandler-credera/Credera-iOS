//
//  AnimalCollectionViewController.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/18/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AnimalCollectionViewController: UICollectionViewController, NavigationHelper {
    public class var storyboardName: String { return "AnimalCollection" }
    public class var viewControllerID: String { return "AnimalCollectionViewController" }
    
    weak var delegate: NavigationCompletedProtocol?
    
    var queriedAnimals: [Animal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        let animalApi: AnimalApi = AnimalApiImpl(caller: RequestCaller())
        let animalService: AnimalService = AnimalServiceImpl(animalApi: animalApi)
        
        animalService.getAllAnimals().then { (animals) in
            self.queriedAnimals = animals.animals
            self.collectionView.reloadData()
            
            animals.animals.map({ (animal) in
                print(animal.name)
                print(animal.age)
                print(animal.id)
                print(animal.mainPhotoUrl)
            })
            }.catch { (error) in
                // Handle error...
                print(error)
        }
    }
    
    public static func getInstance(delegate: NavigationCompletedProtocol) -> UIViewController {
        guard let animalCollectionController = getInstance() as? AnimalCollectionViewController else {
            return UIViewController()
        }
        
        animalCollectionController.delegate = delegate
        
        return animalCollectionController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return queriedAnimals.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "AnimalCollectionViewCell"
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? AnimalCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of AnimalCollectionViewCell.")
        }
        
        let animal = queriedAnimals[indexPath.row]
        
        print(animal)
    
        // Configure the cell
        cell.animalNameLabel.text = animal.name
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}