//
//  ViewController.swift
//  signup page
//
//  Created by Saee Saadat on 2/26/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var topVisualEffect: UIVisualEffectView!
   
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn(_:)))
        view.addGestureRecognizer(tapGesture)
        
        usernameTextfield.text = "aslfja"
        emailTextfield.text = "ljadf@lajf.com"
        passwordTextfield.text = "alfjhkj@12345"
        
        usernameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        setupColorsByColorScheme()
        
        usernameTextfield.layer.cornerRadius = 10.0
        emailTextfield.layer.cornerRadius = 10.0
        passwordTextfield.layer.cornerRadius = 10.0
        signupButton.layer.cornerRadius = 10.0
        
        usernameTextfield.clipsToBounds = true
        emailTextfield.clipsToBounds = true
        passwordTextfield.clipsToBounds = true
        signupButton.clipsToBounds = true
        
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Username" ,
                                                                     attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6802823604, green: 0.01701301704, blue: 0.5529439378, alpha: 0.3984107449)])
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password" , attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6802823604, green: 0.01701301704, blue: 0.5529439378, alpha: 0.3984107449)])
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Email" , attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6802823604, green: 0.01701301704, blue: 0.5529439378, alpha: 0.3984107449)])
        // Do any additional setup after loading the view.
    }


    @IBAction func signUp(_ sender: Any) {
        var wrongInfo = false
        
        if !checkUsername() {
            wrongField(field: usernameTextfield)
            wrongInfo = true
        } else {
            correctField(field: usernameTextfield)
            
        }
        if !checkEmail(){
            wrongField(field: emailTextfield)
            wrongInfo = true
        }else {
            correctField(field: emailTextfield)
        }
        if !checkPassword(){
            wrongField(field: passwordTextfield)
            wrongInfo = true
        }else {
            correctField(field: passwordTextfield)
        }
        if wrongInfo {return}
        
        if let vc = UIStoryboard(name: "verifyPage" , bundle: nil).instantiateViewController(identifier: "verifyPage") as? VerifyViewController{
            navigationController!.pushViewController(vc, animated: true)
        }
        
    }
    
    private func checkUsername() -> Bool {
        if let username = usernameTextfield.text  {
            if username.count  > 3 {
                return true
            }
        }
        
        return false
    }
    
    private func checkEmail() -> Bool{
        if let email = emailTextfield.text {
            let regex = try! NSRegularExpression(pattern: "[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-z]{2,4}$")
            if regex.numberOfMatches(in: email, options: [], range: NSRange(location: 0, length: email.count)) != 0 {
                return true
            }
        }
        return false
    }
    
    private func checkPassword() -> Bool{
        if let password = passwordTextfield.text , password.count > 8{
            let specialCharacters = try! NSRegularExpression(pattern: "[@!#$_\\-\\.\\?\\*&]+")
            let numbers = try! NSRegularExpression(pattern: "[0-9]+")
            let passRange = NSRange(location: 0, length: password.count)
            if specialCharacters.numberOfMatches(in: password, options: [], range: passRange) > 0 ,
            numbers.numberOfMatches(in: password, options: [], range: passRange) > 0{
                return true
            }else {
                passwordTextfield.text = ""
                passwordTextfield.attributedPlaceholder = NSAttributedString(string: "add numbers and special characters" , attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6802823604, green: 0.01701301704, blue: 0.5529439378, alpha: 0.3984107449)])
                return false
            }
        } else {
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "at least 8 characters" , attributes: [NSAttributedString.Key.foregroundColor : ColorSchemes.textFieldPlaceHolderColor])
        }
        return false
    }
    
    private func wrongField(field : UITextField) {
        field.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0.0187217119, alpha: 1)
        field.layer.borderWidth = 3.0
        field.text = ""
    }
    private func correctField(field: UITextField){
        field.layer.borderWidth = 0.0
    }
    
    
    
    private func setupColorsByColorScheme() {
        
        view.backgroundColor = ColorSchemes.backgroundColor
        
        usernameTextfield.backgroundColor = ColorSchemes.textFieldBackgroundColor
        emailTextfield.backgroundColor = ColorSchemes.textFieldBackgroundColor
        passwordTextfield.backgroundColor = ColorSchemes.textFieldBackgroundColor
        
        usernameTextfield.textColor = ColorSchemes.textFieldTextColor
        emailTextfield.textColor = ColorSchemes.textFieldTextColor
        passwordTextfield.textColor = ColorSchemes.textFieldTextColor
        
        signupButton.backgroundColor = ColorSchemes.buttonBackgroundColor
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

