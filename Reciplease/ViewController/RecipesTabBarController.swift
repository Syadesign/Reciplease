//
//  RecipesTabBarController.swift
//  Reciplease
//
//  Created by Michael Martinez on 04/12/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class RecipesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if tabBarState == .search {
             print ("===== index 0 =====")
        } else if tabBarState == .favorites {
             print ("===== index 1 ====")
        }

       
    }
    
    enum TabBarIndex {
        case search
        case favorites
    }
    
    var tabBarState: TabBarIndex = .search {
        didSet {
            switch tabBarState {
            case .search:
                self.selectedIndex = 0
//                self.tabBarItem.tag = 0
            case .favorites:
                self.selectedIndex = 1
//                self.tabBarItem.tag = 0
        }
        }
    }

  

}
