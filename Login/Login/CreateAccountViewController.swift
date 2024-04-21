//
//  CreateAccountViewController.swift
//  Login
//
//  Created by Nguyen Hong Phuc on 4/19/24.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpClick(_ sender: UIButton) {
        
        if emailTextField.text!.isEmpty == true{
            print("No text in email field")
            return
        }
        
        if passwordTextField.text!.isEmpty == true {
            print("No text in password field")
            return
        }
        
        signUp()
        
        
    }
    
    @IBAction func alreadyHaveAnAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    func signUp() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error \(error?.localizedDescription)")
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
    }

}
