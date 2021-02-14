//
//  ProfileScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 01/01/2020.
//  Copyright © 2020 MacOS Mojave. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet weak var mainText: UILabel!
    
    @IBOutlet weak var UserFoto: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var nameANDsurnameLabel: UILabel!
    
    @IBOutlet weak var pointsButton: UIButton!
    
    //          View setings        //
        @IBOutlet weak var settingsView: UIView!
        @IBOutlet weak var settingsPicker: UISegmentedControl!
        @IBOutlet weak var applyButton: UIButton!
        @IBOutlet weak var newValue: UITextField!
    // ............................//
    
    override func viewDidLoad()
    {
        settingsView.layer.cornerRadius = 20
        applyButton.layer.cornerRadius = 10
        
        super.viewDidLoad()
        
        USctrl = self
        
        model.updateView()
        
        UserFoto.image = model.foto
        loginLabel.text = model.login

        newValue.delegate = self

        UserFoto.layer.cornerRadius = UserFoto.frame.width / 2
        
    }
    
    @IBAction func ClickPlay(_ sender: UIButton)
    {
        model.userStartGame()
    }
    
    @IBAction func ClickPoints(_ sender: UIButton)
    {
        model.userCheckPoints()
    }
    
    @IBAction func ClickSettings(_ sender: UIButton)
    {
        settingsView.isHidden = false
    }
    
//.............................................//
//                  settings                   //
//.............................................//
    
    @IBAction func pickWhatChange(_ sender: UISegmentedControl)
    {
        model.pickWhatChange()
    }
    
    @IBAction func applyChanges(_ sender: UIButton)
    {
        model.applyChange()
        model.updateView()
        settingsView.isHidden = true
        newValue.text = ""
    }
    
    @IBAction func backButton(_ sender: UIButton)
    {
        settingsView.isHidden = true
    }
    
    @IBAction func deleteAccount(_ sender: UIButton)
    {
        model.deleteAccount()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        newValue.resignFirstResponder()
        return true
    }
    
}
