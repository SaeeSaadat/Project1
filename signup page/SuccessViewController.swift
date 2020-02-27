//
//  SuccessViewController.swift
//  signup page
//
//  Created by Saee Saadat on 2/27/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        swipe.direction = [.right]
        view.addGestureRecognizer(swipe)
        
        setupColorsByColorScheme()

    }
    
    private func setupColorsByColorScheme() {
        
        view.backgroundColor = ColorSchemes.backgroundColor
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc private func goBack(){
        navigationController?.popViewController(animated: true)
    }

}
