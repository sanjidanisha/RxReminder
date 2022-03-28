//
//  ViewController.swift
//  RxReminder
//
//  Created by Sanjida Ayman Nisha on 2/8/22.
//  Copyright © 2022 Sanjida Nisha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
//        ref = Database.database().reference()
//
//        self.ref.child("user_id").setValue(123456)
//        self.ref.child("name").setValue("Nisha")
//        self.ref.child("age").setValue(65)
        
    
        
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
    }
    
    @IBOutlet weak var usernameIcon: UITextField!{
       didSet {
          usernameIcon.tintColor = UIColor.lightGray
          usernameIcon.setIcon(UIImage(named: "username")!)
       }
    }
    
    @IBOutlet weak var passwordIcon: UITextField!{
       didSet {
          passwordIcon.tintColor = UIColor.lightGray
          passwordIcon.setIcon(UIImage(named: "key")!)
       }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: username, password: password) { (result,error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                
            }
        }
    }
    
}


extension UITextField {
   func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}

extension ViewController: FUIAuthDelegate {

    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?)
    {
        if error != nil {
            return
        }
        performSegue(withIdentifier: "HomePage", sender: self)
    }
    
}

