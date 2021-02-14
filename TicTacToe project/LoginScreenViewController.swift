//
//  LoginScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 01/01/2020.
//  Copyright © 2020 MacOS Mojave. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var mainText: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginRegister: UIButton!
    @IBOutlet weak var goToProfile: UIButton!
    @IBOutlet weak var loginRegisterChanger: UISegmentedControl!
    
    @IBOutlet weak var addFotoButton: UIButton!
    
    @IBOutlet weak var userFoto: UIImageView!
    
    @IBOutlet weak var errorInfo: UIImageView! // haslo
    @IBOutlet weak var loginErrorInfo: UIImageView! // login
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        LSctrl = self
        
        loginRegister.layer.cornerRadius = 10
        goToProfile.layer.cornerRadius = 10
        userFoto.layer.cornerRadius = userFoto.frame.width / 2
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        passwordTextField.delegate = self
        loginTextField.delegate = self
        
        errorInfo.image = nil
        model.register = true
        
    }
    
    
    @IBAction func PickLoginOrRegister(_ sender: UISegmentedControl)
    {
        model.Pick_Login_or_register()
    }
    
    
    @IBAction func LoginOrRegister(_ sender: UIButton)
    {
        model.loginORregisterClick()
    }
    
    @IBAction func goToProfile(_ sender: UIButton)
    {
        model.goToProfile()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        nameTextField.resignFirstResponder()
        surnameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        loginTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func addFoto(_ sender: UIButton)
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType =
        UIImagePickerController.SourceType.photoLibrary
        myPickerController.allowsEditing = true
        present(myPickerController, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
         didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
         picker.dismiss(animated: true)

         guard let image = info[.editedImage] as? UIImage else
         {
             print("No image found")
             return
         }
        userFoto.image = image
        }
    
    
}
