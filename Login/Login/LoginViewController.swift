//
//  LoginViewController.swift
//  Login
//
//  Created by Nguyen Hong Phuc on 4/19/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }
//    

    @IBAction func loginClicked(_ sender: UIButton) {
        validataFields()
    }
    
    @IBAction func createClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    
            
    }
    
    func validataFields(){
        if emailTextField.text!.isEmpty == true{
            print("Email no text")
            return
        }
        
        if passwordTextField.text!.isEmpty{
            print("Password no text")
            return
        }
        login()
    }
    
    func login()  {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {  [weak self] authResult, error in
            guard let strongSelf = self else {return}
            if let err = error{
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    func checkUserInfo() {
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
