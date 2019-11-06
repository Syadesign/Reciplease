//
//  ResearchViewController.swift
//  Reciplease
//
//  Created by Samahir Adi on 06/11/2019.
//  Copyright © 2019 Samahir Adi. All rights reserved.
//

import UIKit

class ResearchViewController: UIViewController {
    // MARK: - Variables
    var ingredientsArray: [String] = [] {
        didSet {
            self.ingredientsTableView.reloadData()
        }
    }
    private static let kCellId = "IngredientsTableViewCell"

    // MARK: - Outlets
    @IBOutlet weak var okButtonView: UIButton!
    @IBOutlet weak var ingredientsTextField: UITextField!
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonView()
        setupTableView()
        
    }
    
    // MARK: - Actions
    @IBAction func addIngredientsButton(_ sender: Any) {
        if let text = ingredientsTextField.text {
            ingredientsArray.append(text)
            print ("TEXT ingredients \(text)")
        }
        ingredientsTextField.text = ""
    }
    
    // MARK: - Methods
    func setupButtonView() {
        okButtonView.layer.cornerRadius = okButtonView.frame.height / 8
    }
    
    func setupTableView() {
        self.ingredientsTableView.delegate = self
        self.ingredientsTableView.dataSource = self
        let nib = UINib(nibName: ResearchViewController.kCellId, bundle: nil)
        self.ingredientsTableView.register(nib, forCellReuseIdentifier: ResearchViewController.kCellId)
    }
    

}

extension ResearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResearchViewController.kCellId, for: indexPath) as! IngredientsTableViewCell
        cell.ingredientLabel.text = ingredientsArray[indexPath.row]
        return cell
    }
    
    
}
