//
//  Generate.swift
//  iSecure
//
//  Created by Saikumar Pallagani on 19/04/18.
//  Copyright © 2018 Saikumar Pallagani. All rights reserved.
//

import UIKit

class Generate: UIViewController {

    
    @IBOutlet weak var GPOneTF: UITextField!
    @IBOutlet weak var GPTwoTF: UITextField!
    @IBOutlet weak var GPThreeTF: UITextField!
    @IBOutlet weak var GPFourTF: UITextField!
    
    
    @IBOutlet weak var CPOneTF: UITextField!
    @IBOutlet weak var CPTwoTF: UITextField!
    @IBOutlet weak var CPThreeTF: UITextField!
    @IBOutlet weak var CPFourTF: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GPOneTF.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        GPTwoTF.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        GPThreeTF.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        GPFourTF.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        
        CPOneTF.addTarget(self, action: #selector(confirmPasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        CPTwoTF.addTarget(self, action: #selector(confirmPasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        CPThreeTF.addTarget(self, action: #selector(confirmPasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        CPFourTF.addTarget(self, action: #selector(confirmPasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        
        saveBtn.layer.cornerRadius = 4
        saveBtn.clipsToBounds = true
        
    }
    
    
    @objc func generatePasswordTextFieldDidChanged(textField : UITextField) -> Void {
        
        if (textField.text?.count)! > 0 {
            
            switch textField {
                
            case GPOneTF:
                
                self.GPTwoTF.becomeFirstResponder()
                break
                
            case GPTwoTF:
                
                self.GPThreeTF.becomeFirstResponder()
                break
                
            case GPThreeTF:
                
                self.GPFourTF.becomeFirstResponder()
                break
                
            case GPFourTF:
                
                self.GPFourTF.resignFirstResponder()
                break
                
            default:
                
                break
                
            }
            
        } else {
            
            switch textField {
                
            case GPFourTF:
                
                self.GPThreeTF.becomeFirstResponder()
                break
                
            case GPThreeTF:
                
                self.GPTwoTF.becomeFirstResponder()
                break
                
            case GPTwoTF:
                
                self.GPOneTF.becomeFirstResponder()
                break
                
            case GPOneTF:
                
                self.GPOneTF.resignFirstResponder()
                break
                
            default:
                
                break
                
            }
            
        }
        
    }
    
    
    
    
    @objc func confirmPasswordTextFieldDidChanged(textField : UITextField) -> Void {
        
        if (textField.text?.count)! > 0 {
            
            switch textField {
                
            case CPOneTF:
                
                self.CPTwoTF.becomeFirstResponder()
                break
                
            case CPTwoTF:
                
                self.CPThreeTF.becomeFirstResponder()
                break
                
            case CPThreeTF:
                
                self.CPFourTF.becomeFirstResponder()
                break
                
            case CPFourTF:
                
                self.CPFourTF.resignFirstResponder()
                break
                
            default:
                
                break
                
            }
            
        } else {
            
            switch textField {
                
            case CPFourTF:
                
                self.CPThreeTF.becomeFirstResponder()
                break
                
            case CPThreeTF:
                
                self.CPTwoTF.becomeFirstResponder()
                break
                
            case CPTwoTF:
                
                self.CPOneTF.becomeFirstResponder()
                break
                
            case CPOneTF:
                
                self.CPOneTF.resignFirstResponder()
                break
                
            default:
                
                break
                
            }
            
        }
        
    }
    
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        let generatePIN = GPOneTF.text!+GPTwoTF.text!+GPThreeTF.text!+GPFourTF.text!
        let confirmPIN = CPOneTF.text!+CPTwoTF.text!+CPThreeTF.text!+CPFourTF.text!
        
        if generatePIN.count < 4 {
            
            SingleToneClass.shared.showAlert(target: self, title: "Alert..!", message: "Please enter 4 digit PIN") {
                
                self.GPOneTF.text = ""
                self.GPTwoTF.text = ""
                self.GPThreeTF.text = ""
                self.GPFourTF.text = ""
                
            }
            
        } else if confirmPIN != generatePIN {
            
            SingleToneClass.shared.showAlert(target: self, title: "Alert..!", message: "PIN and Confirm PIN must be same") {
                
                self.CPOneTF.text = ""
                self.CPTwoTF.text = ""
                self.CPThreeTF.text = ""
                self.CPFourTF.text = ""
                
            }
            
        } else {
            
            UserDefaults.standard.set(true, forKey: "IsPINGenerated")
            UserDefaults.standard.set(confirmPIN, forKey: "PINforLogin")
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
}

