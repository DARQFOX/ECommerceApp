//
//  SignupTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/14/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit
import Firebase

class SignupTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var createPasswordTextField: UITextField!
    
    
    @IBAction func changeProfilePicDidTap(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func createNewAccountDidTap(_ sender: Any) {
        if (emailTextField.text?.isValidEmailAddress)! && (createPasswordTextField.text?.count)! > 6 && (usernameTextField.text?.count)! > 6 && fullNameTextField.text != "" && profileImageView != nil {
            let username = usernameTextField.text!
            let email = emailTextField.text!
            let password = createPasswordTextField.text!
            let fullName = fullNameTextField.text!
            
            // Sign up a new account
            Auth.auth().createUser(withEmail: email, password: password) { (User, error) in
                
                if error != nil {
                    print(error as Any)
                } else {
                    // Save the user's information
                    let newUser = ECUser(uid: (User?.user.uid)!, username: username, profileImage: self.profileImageView.image!, email: email, fullName: fullName)
                    newUser.save(completion: { (error) in
                        if error != nil {
                            print(error as Any)
                        } else {
                            // Successfully signed up a new account
                            // log in the user to use the app
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (User, error) in
                                if let error = error {
                                    print(error)
                                } else {
                                    self.dismiss(animated: false, completion: nil)
                                }
                            })
                        }
                    })
                }
                
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImageView.image = pickedImage
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
            profileImageView.layer.masksToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension String {
    var isValidEmailAddress: Bool {
        let types: NSTextCheckingResult.CheckingType = [.link]
        let linkDetector = try? NSDataDetector(types: types.rawValue)
        let range = NSRange(location: 0, length: self.count)
        let result = linkDetector?.firstMatch(in: self, options: .reportCompletion, range: range)
        let scheme = result?.url?.scheme ?? ""
        return scheme == "mailto" && result?.range.length == self.count
    }
}

































