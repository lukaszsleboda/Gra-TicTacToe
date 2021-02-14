//
//  Model.swift
//  TicTacToe project
//
//  Created by MacOS on 27/12/2019.
//  Copyright © 2019 MacOS Mojave. All rights reserved.
//

import Foundation
import UIKit

var NSctrl = NameSetScreenViewController()
var GSctrl = GameScreenViewController()
var StatCtrl = StstisticScreenViewController()
var LSctrl = LoginScreenViewController()
var USctrl = ProfileScreenViewController()
var RPctrl = ResetPasswordViewController()

let statistic = UserDefaults.standard // statystyki graczy z quickgame
let accounts = UserDefaults.standard // user accounts


class Model
{
   
//............................................................................//

//                             Name set screen                                //

//............................................................................//

    var a: Int  = 0
    
    var SPnameString: String = ""
    var FPnameString: String = ""
    
    var FPreadyFlag = false
    var SPreadyFlag = false
    
    var FPpoints = 0
    var SPpoints = 0
    
    var winner = false // false -> X    true -> O
    var draw = false
    
    var FPcolor = #colorLiteral(red: 1, green: 0.5411368741, blue: 0.2144555707, alpha: 1)
    var SPcolor = #colorLiteral(red: 0.1694690646, green: 0.1674307232, blue: 0.9991181493, alpha: 1)
    var color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    var playWithFoto1 = false
    var playWithFoto2 = false
    
    func FPcolorSet()
    {
        a = Int(NSctrl.FPstepper.value)
        setColor(color: FPcolor, i: a)
        FPcolor = self.color
        NSctrl.Xlabel.textColor = FPcolor
        NSctrl.FPreadyButton.backgroundColor = FPcolor
    }
    
    
    func SPcolorSet()
    {
        a = Int(NSctrl.SPstepper.value)
        setColor(color: SPcolor, i: a)
        SPcolor = self.color
        NSctrl.Olabel.textColor = SPcolor
        NSctrl.SPreadyButton.backgroundColor = SPcolor
    }
    
    func setColor(color: UIColor, i: Int)
    {
        switch i
        {
        case 0:
            self.color = #colorLiteral(red: 1, green: 0.5411368741, blue: 0.2144555707, alpha: 1)
        case 1:
            self.color = #colorLiteral(red: 0.1694690646, green: 0.1674307232, blue: 0.9991181493, alpha: 1)
        case 2:
            self.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 3:
            self.color = #colorLiteral(red: 0.1532756349, green: 0.6637386658, blue: 0, alpha: 0.8470588235)
            
        default:
            self.color = #colorLiteral(red: 1, green: 0.5411368741, blue: 0.2144555707, alpha: 1)
        }
    }
    
    
    func FPready(name: String)
    {
        FPnameString = name
        FPreadyFlag = true
        
        if model.SPreadyFlag == true {NSctrl.StartButton.isHidden = false}
    }
    

        
    func SPready(name: String)
    {
        SPnameString = name
        SPreadyFlag = true
        
        if model.SPreadyFlag == true {NSctrl.StartButton.isHidden = false}
    }
    

    var foto1:UIImage? = nil
    var foto2:UIImage? = nil
    
    func pickFoto()
    {

            let myPickerController = UIImagePickerController()
            myPickerController.delegate = NSctrl.self;
            myPickerController.sourceType =
            UIImagePickerController.SourceType.photoLibrary
            myPickerController.allowsEditing = true
            NSctrl.present(myPickerController, animated: true)
    }
        

    
    

    //............................................................................//
        
    //                             Name Ser screen                                //
    
    //............................................................................//
    
    var activePlayer = 1 // 1->X    0->O
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameIsActive = true

    func Game(_ z: Int)
    {
        
        if (gameState[z-1] == 0 && gameIsActive == true)
        {
            gameState[z-1] = activePlayer
            
            if (activePlayer == 1)
            {
                activePlayer = 2
            }
            else
            {
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    GSctrl.turnLabel.text = FPnameString + " won!"
                    winner = true
                    updatePoints()
                }
                else
                {
                    GSctrl.turnLabel.text = SPnameString + " won!"
                    winner = false
                    updatePoints()
                }
                GSctrl.PlayAgain.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false
        {
            GSctrl.turnLabel.text = "IT WAS A DRAW"
            GSctrl.PlayAgain.isHidden = false
            draw = true
        }
        
    }
    


    func SetNewGame()
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        GSctrl.PlayAgain.isHidden = true
        GSctrl.turnLabel.text = ""
        
        draw = false
        
        for i in 1...9
        {
            let button = GSctrl.view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
        GSctrl.backButton.isHidden = false
    }
    
  func updatePoints()
    {
        if winner == true && draw == false
        {
            FPpoints = FPpoints+1
            GSctrl.FPpointsLabel.text = String(FPpoints)
        }
        else if winner == false && draw == false
        {
            SPpoints = SPpoints+1
            GSctrl.SPpointsLabel.text = String(SPpoints)
        }
        
            if FPpoints > SPpoints
            {
                GSctrl.FPpointsLabel.textColor = #colorLiteral(red: 0.1532756349, green: 0.6637386658, blue: 0, alpha: 0.8470588235)
                GSctrl.SPpointsLabel.textColor = #colorLiteral(red: 0.6637386658, green: 0, blue: 0, alpha: 0.8470588235)
            }
            else if (FPpoints == SPpoints)
            {
                GSctrl.FPpointsLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
                GSctrl.SPpointsLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
            }
            else
            {
                GSctrl.FPpointsLabel.textColor = #colorLiteral(red: 0.6637386658, green: 0, blue: 0, alpha: 0.8470588235)
                GSctrl.SPpointsLabel.textColor = #colorLiteral(red: 0.1532756349, green: 0.6637386658, blue: 0, alpha: 0.8470588235)
            }
    
    }
    
    func endGame()
    {
       // SetNewGame()
        
            if statistic.integer(forKey: FPnameString) != 0
                {
                let newPoints = statistic.integer(forKey: FPnameString) + FPpoints
                statistic.set(newPoints, forKey: FPnameString)
                }
            else
                {
                    statistic.set(FPpoints, forKey: FPnameString)
                }
        
        
            if statistic.integer(forKey: SPnameString) != 0
                {
                let newPoints = statistic.integer(forKey: SPnameString) + SPpoints
                statistic.set(newPoints, forKey: SPnameString)
                }
            else
                {
                    statistic.set(SPpoints, forKey: SPnameString)
                }
            
            FPpoints = 0
            SPpoints = 0
        
            playWithFoto1 = false
            playWithFoto2 = false
    }
    
    //............................................................................//
    
    //                             Statistic screen                               //
    
    //............................................................................//
    
    var Name = ""
    
    func checkPoints()
    {
        Name = StatCtrl.nameLabel.text ?? ""
        StatCtrl.stat1.text = String(statistic.integer(forKey: Name))
    }
    
    func resetPoints()
    {
        statistic.set(0, forKey: Name)
    }
    
    //............................................................................//
    
    //                             Register Login screen                          //
    
    //............................................................................//
    
    var register = true
    var login = ""
    var foto:UIImage? = nil
    
    func Pick_Login_or_register()
    {
        LSctrl.nameTextField.text = ""
        LSctrl.surnameTextField.text = ""
        LSctrl.passwordTextField.text = ""
        LSctrl.userFoto.image = UIImage(named: "loginIcon.png")
        LSctrl.loginErrorInfo.isHidden = true
        LSctrl.errorInfo.image = nil
        
        switch LSctrl.loginRegisterChanger.selectedSegmentIndex
        {
            case 1: // logowanie
                LSctrl.loginRegister.setTitle("Login", for: UIControl.State())
                LSctrl.mainText.text = "Login to your account"
                LSctrl.nameTextField.isHidden = true
                LSctrl.surnameTextField.isHidden = true
                LSctrl.goToProfile.isHidden = true
                LSctrl.loginRegister.isHidden = false
                LSctrl.addFotoButton.isHidden = true
                LSctrl.loginTextField.frame.origin = CGPoint(x: 99, y: 330)
                LSctrl.passwordTextField.frame.origin = CGPoint(x: 99, y: 379)
                LSctrl.loginRegister.frame.origin = CGPoint(x: 140, y: 430)
                register = false
                
            
            case 0: // rejestracja
                LSctrl.loginRegister.setTitle("Register", for: UIControl.State())
                LSctrl.mainText.text = "Create your account"
                LSctrl.nameTextField.isHidden = false
                LSctrl.surnameTextField.isHidden = false
                LSctrl.goToProfile.isHidden = true
                LSctrl.loginRegister.isHidden = false
                  LSctrl.addFotoButton.isHidden = false
                LSctrl.loginTextField.frame.origin = CGPoint(x: 99, y: 432)
                LSctrl.passwordTextField.frame.origin = CGPoint(x: 99, y: 484)
                LSctrl.loginRegister.frame.origin = CGPoint(x: 140, y: 544)
                register = true
            
            default:
                LSctrl.loginRegister.setTitle("Login", for: UIControl.State())
        }
        
        
        
    }
    
    func loginORregisterClick()
    {
        if register == true
            {
                let thisLogin = String((LSctrl.loginTextField.text ?? ""))

                if accounts.string(forKey: thisLogin + "login") == nil
                {
                
                accounts.set(LSctrl.nameTextField.text, forKey: ((LSctrl.loginTextField.text ?? "") + "name"))
                accounts.set(LSctrl.surnameTextField.text, forKey: ((LSctrl.loginTextField.text ?? "") + "surname"))
                accounts.set(LSctrl.loginTextField.text, forKey: ((LSctrl.loginTextField.text ?? "") + "login"))
                accounts.set(LSctrl.passwordTextField.text, forKey:  ((LSctrl.loginTextField.text ?? "") + "password"))
                let imageData: NSData = LSctrl.userFoto.image!.pngData()! as NSData
                accounts.set(imageData, forKey: ((LSctrl.loginTextField.text ?? "") + "foto"))
                    print("tworze konto")
                }
                else
                {
                    LSctrl.loginErrorInfo.isHidden = false
                    print("konto z tym loginem istanieje")
                }
            }
            
        else if register == false // logowanie
            {

                 login = LSctrl.loginTextField.text ?? ""
                
                if accounts.string(forKey: (login) + "password") == LSctrl.passwordTextField.text
                {
                    LSctrl.goToProfile.isHidden = false
                    LSctrl.loginRegister.isHidden = true
                    let data = accounts.object(forKey: login + "foto") as! NSData
                    foto = UIImage(data: data as Data)
                    LSctrl.userFoto.image = foto
                    LSctrl.errorInfo.image = UIImage(named: "ok.png")
                    print("zalogowano")
                }
                else
                {
                    LSctrl.errorInfo.image = UIImage(named: "error.png")
                    print("zle haslo")
                }
            }
    }
    
    var name = ""
    var surname = ""

    
    
    
    func goToProfile()
    {
        name = accounts.string(forKey: (login) + "name") ?? ""
        surname = accounts.string(forKey: (login) + "surname") ?? ""
        print(name)
    }
    
    //............................................................................//
    
    //                             User Profile screen                            //
     
    //............................................................................//
    
  func updateView()
    {
        USctrl.mainText.text = "Hellow " + name + " " + surname
        USctrl.nameANDsurnameLabel.text = name + " " + surname
    }
    
  func userStartGame()
    {
        playWithFoto1 = false
        FPnameString = " " + name
        FPcolor = #colorLiteral(red: 0, green: 0.5377981067, blue: 0.8244105577, alpha: 1)
            
        playWithFoto2 = false
        SPnameString = "Przeciwnik"
        
    }
    
    func userCheckPoints()
    {
        let points = String(statistic.integer(forKey: " " + name))
        USctrl.pointsButton.setTitle( " Your points: " + points , for: .normal)
    }
    
    
    func deleteAccount()
    {
        accounts.set(nil, forKey: ((login) + "name"))
        accounts.set(nil, forKey: ((login) + "surname"))
        accounts.set(nil, forKey: ((login) + "login"))
        accounts.set(nil, forKey:  ((login) + "password"))
        accounts.set(nil, forKey: ((login) + "foto"))
            print("usuwam konto")
    }

    //............................................................................//
    
    //                              Settings View                                 //

    //............................................................................//

    
    func pickWhatChange()
    {
        print(login)
        switch USctrl.settingsPicker.selectedSegmentIndex
        {
        case 0:
            USctrl.newValue.placeholder = "Type new Name"
            
        case 1:
            USctrl.newValue.placeholder = "Type new Surname"
            
        case 2:
            USctrl.newValue.placeholder = "Type new Password"
        default:
            print(" ")
        }
    }
    
    
    func applyChange()
    {
        print(USctrl.settingsPicker.selectedSegmentIndex)
        switch USctrl.settingsPicker.selectedSegmentIndex {
        case 0:
             let newName = USctrl.newValue.text
             accounts.set(newName, forKey: ((login) + "name"))
             name = newName ?? "Jeeezu nic nie wpisałeś"
            
        case 1:
            let newSurname = USctrl.newValue.text
            accounts.set(newSurname, forKey: ((login) + "surname"))
            surname = newSurname ?? "Jeeezu nic nie wpisałeś"
        case 3: // NIE DZIALA
            let newPassword = String(USctrl.newValue.text ?? "")
                        print(newPassword)
            print(String(USctrl.newValue.text ?? ""))
            accounts.set(newPassword, forKey: ((login) + "password"))

            
        default:
            print("")
        }
        
        
    }

    //............................................................................//
    
    //                              Reset Password View                                 //

    //............................................................................//
    
    
    func resetPassword()
    {
        let loginToCheck = RPctrl.loginTextField.text
        let surnameToCheck = RPctrl.surnameTextField.text

        let trueSurname = accounts.string(forKey: (String(loginToCheck ?? "") ) + "surname")
        let password = accounts.string(forKey: String(loginToCheck ?? "") + "password")

        if surnameToCheck == trueSurname
            {
                RPctrl.passwordField.text = password
            }
        else
            {
                RPctrl.passwordField.text = "Podane dane są błędne"
                print((password ))
            }
    }
    
    
} // koniec pliku
