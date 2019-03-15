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
    func showNavigationCompleted()
}

class FirstViewController: UIViewController {
    
    let passedAlongInformationBetweenVC: String = "This is an example of passing information from one VC to another"
    var youngSelected: Bool = false
    var adultSelected: Bool = false
    var seniorSelected: Bool = false
    
    @IBOutlet weak var navigationStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = AppHeaderView()
        
        // TODO: These can be set up through dependency injection instead...
        let userApi: UserApi = UserApiImpl(caller: RequestCaller())
        let userService: UserService = UserServiceImpl(userApi: userApi)
        
        userService.getAllUsers().then { (users) in
            print(users)
        }.catch { (error) in
            // Handle error...
        }
        
        userService.getUserByUsername(username: "Bret").then { (user) in
            print(user)
            }.catch { (error) in
                // Handle error...
                print(error)
        }
    }
    
    @IBAction func navigationExampleButtonClicked(_ sender: Any) {
        var selectedAges: [String] = []
        if youngSelected {
            selectedAges.append("young")
        }
        if adultSelected {
            selectedAges.append("adult")
        }
        if seniorSelected {
            selectedAges.append("senior")
        }
        
        let navigationIntermediateScreen = NavigationIntermediateViewController.getInstance(passedInformation: passedAlongInformationBetweenVC, selectedAges: selectedAges, delegate: self)
        
        navigationController?.pushViewController(navigationIntermediateScreen, animated: true)
    }
    
    @IBAction func youngButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = UIColor.green
            youngSelected = true
        } else {
            sender.backgroundColor = UIColor.red
            youngSelected = false
        }
    }
    
    @IBAction func adultButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = UIColor.green
            adultSelected = true
        } else {
            sender.backgroundColor = UIColor.red
            adultSelected = false
        }
    }
    
    @IBAction func seniorButtonClicked(_ sender: UIButton) {
        sender.backgroundColor = UIColor.green
    }
}

extension FirstViewController: NavigationCompletedProtocol {
    func showNavigationCompleted() {
        navigationStatusLabel.text = "Navigation to Final VC has been completed"
        navigationStatusLabel.textColor = UIColor.red
    }
}
