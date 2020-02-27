//
//  VerifyViewController.swift
//  signup page
//
//  Created by Saee Saadat on 2/27/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var topVisualEffect: UIVisualEffectView!
    
    @IBOutlet var digitTextfields: [UITextField]!
    
    @IBOutlet weak var verifyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorsByColorScheme()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn(_:)))
        view.addGestureRecognizer(tapGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        swipeGesture.direction = [.right]
        view.addGestureRecognizer(swipeGesture)
        
        verifyButton.layer.cornerRadius = 10.0
        verifyButton.clipsToBounds = true
        
        for digitField in digitTextfields {
            digitField.addTarget(self, action: #selector(digitFieldDidChange(sender:)), for: .editingChanged)        }
        
    }
    

    @IBAction func verify(_ sender: Any) {
        for digit in digitTextfields {
            if digit.text == nil || digit.text?.count != 1 {
                digit.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
                digit.layer.borderWidth = 3.0
                return
            }
        }
      
        let storyBoard = UIStoryboard(name: "successPage" , bundle: nil)
        if let vc = storyBoard.instantiateViewController(identifier: "successPage") as? SuccessViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
        print()
    }
    
    
    private func setupColorsByColorScheme() {
        
        view.backgroundColor = ColorSchemes.backgroundColor
        
        digitTextfields.forEach {
            $0.backgroundColor = ColorSchemes.textFieldBackgroundColor
            $0.textColor = ColorSchemes.textFieldTextColor
            $0.layer.cornerRadius = 10.0
            $0.clipsToBounds = true
        }
        
        
        verifyButton.backgroundColor = ColorSchemes.buttonBackgroundColor
    }
    
    @objc private func digitFieldDidChange(sender: UITextField){
        print("digitFieldDidChange")
        if let text = sender.text {
            if text.count > 1 {
                sender.text = String(text.last!)
            }
        }
        if let text = sender.text , text.count == 1 {
            if let index = digitTextfields.firstIndex(of : sender) {
                if index < digitTextfields.count - 1 {
                    digitTextfields[index+1].becomeFirstResponder()
                }else {
                    digitTextfields[index].resignFirstResponder()
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return true
       }

    @objc private func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
}
