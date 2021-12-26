//
//  MainViewController.swift
//  Color pallet
//
//  Created by Victor on 26.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateColor(for background: UIColor)
}
class StartColorViewController: UIViewController {
        
    
// MARK: - Public Properties
    var redColor: CIColor!
    var greenColor: CIColor!
    var blueColor: CIColor!
    
// MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsColorViewController else { return }
            settingsVC.color = view.backgroundColor
            settingsVC.delegate = self
    }
}
// MARK: - @IBActions

// MARK: - Public Methods

extension StartColorViewController: SettingsViewControllerDelegate {
    func updateColor(for background: UIColor) {
        view.backgroundColor = background
    }
    
    
}

// MARK: - Private Methods
