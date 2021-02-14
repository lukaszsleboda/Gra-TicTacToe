//
//  NameSetScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 27/12/2019.
//  Copyright © 2019 MacOS Mojave. All rights reserved.
//

import UIKit
    var model = Model()
class NameSetScreenViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var FPreadyButton: UIButton!
    @IBOutlet weak var SPreadyButton: UIButton!
    
    @IBOutlet weak var Xlabel: UILabel!
    @IBOutlet weak var Olabel: UILabel!
    
    @IBOutlet weak var FPname: UITextField!
    @IBOutlet weak var SPname: UITextField!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var FPstepper: UIStepper!
    @IBOutlet weak var SPstepper: UIStepper!
    
    @IBOutlet weak var FPfotoView: UIImageView!
    @IBOutlet weak var SPfotoView: UIImageView!
    
    @IBOutlet weak var FPsetFotoButton: UIButton!
    @IBOutlet weak var SPsetFotoButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NSctrl = self

        FPname.delegate = self
        SPname.delegate = self
        
        StartButton.layer.cornerRadius = 20
        FPreadyButton.layer.cornerRadius = 10
        SPreadyButton.layer.cornerRadius = 10
        
        FPsetFotoButton.layer.cornerRadius = 10
        SPsetFotoButton.layer.cornerRadius = 10
        

        let radius = FPfotoView.frame.width / 2
        FPfotoView.layer.cornerRadius = radius
        FPfotoView.layer.masksToBounds = true
        SPfotoView.layer.cornerRadius = radius
        SPfotoView.layer.masksToBounds = true

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        FPname.resignFirstResponder()
        SPname.resignFirstResponder()
        return true
    }
    
    
    @IBAction func FPready(_ sender: UIButton)
    {
        model.FPready(name: FPname.text ?? "anonimowy gracz")
    }
    
    
    @IBAction func SPready(_ sender: UIButton)
    {
        model.SPready(name: SPname.text ?? "anonimowy gracz 2")
    }
    
    @IBAction func FPstepper(_ sender: UIStepper)
    {
        model.FPcolorSet()
    }
    
    @IBAction func SPstepper(_ sender: UIStepper)
    {
        model.SPcolorSet()
    }
    
    var FPflag = false
    
    @IBAction func FPsetFoto(_ sender: UIButton)
    {
        FPflag = true
        model.pickFoto()
        model.playWithFoto1 = true
    }
    
    @IBAction func SPsetFoto(_ sender: UIButton)
    {
        model.pickFoto()
        model.playWithFoto2 = true
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
           
        if FPflag == true
            {
            FPfotoView.image = image
            model.foto1 = image
            }
        else
            {
            SPfotoView.image = image
            model.foto2 = image
            }
        
            FPflag = false
        }

    
    
}



