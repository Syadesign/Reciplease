//
//  ViewController.swift
//  Reciplease
//
//  Created by Samahir Adi on 04/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    //MARK: - View cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonView()
        navigationController?.isNavigationBarHidden = true
    }


    //MARK: - Outlets
    @IBOutlet weak var beginButtonView: UIButton!
    
    
    //MARK: - Methods
    
    func setupButtonView() {
        beginButtonView.layer.cornerRadius = beginButtonView.frame.height / 5
    }
}



