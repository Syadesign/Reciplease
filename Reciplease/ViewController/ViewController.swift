//
//  ViewController.swift
//  Reciplease
//
//  Created by Samahir Adi on 04/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var beginButtonView: UIButton!
    
    
    // MARK: - View cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }

   

    // MARK: - Methods
    
    func setupButtonView() {
        beginButtonView.layer.cornerRadius = beginButtonView.frame.height / 5
        
    }
    
}



