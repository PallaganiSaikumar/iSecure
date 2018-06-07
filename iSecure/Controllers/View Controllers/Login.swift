//
//  Login.swift
//  iSecure
//
//  Created by Saikumar Pallagani on 19/04/18.
//  Copyright © 2018 Saikumar Pallagani. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var getInBtn: UIButton!
    
    @IBOutlet weak var pinTFOne: UITextField!
    @IBOutlet weak var pinTFTwo: UITextField!
    @IBOutlet weak var pinTFThree: UITextField!
    @IBOutlet weak var pinTFFour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTFOne.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        pinTFTwo.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        pinTFThree.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        pinTFFour.addTarget(self, action: #selector(generatePasswordTextFieldDidChanged(textField:)), for: .editingChanged)
        
        self.getInBtn.isHidden = true

    }

    
    @objc func generatePasswordTextFieldDidChanged(textField : UITextField) -> Void {
        
        if (textField.text?.count)! > 0 {
            
            switch textField {
                
            case pinTFOne:
                
                self.pinTFTwo.becomeFirstResponder()
                break
                
            case pinTFTwo:
                
                self.pinTFThree.becomeFirstResponder()
                break
                
            case pinTFThree:
                
                self.pinTFFour.becomeFirstResponder()
                break
                
            case pinTFFour:
                
                self.pinTFFour.resignFirstResponder()
                validateAndLogin()
                break
                
            default:
                
                break
                
            }
            
        } else {
            
            switch textField {
                
            case pinTFFour:
                
                self.pinTFThree.becomeFirstResponder()
                break
                
            case pinTFThree:
                
                self.pinTFTwo.becomeFirstResponder()
                break
                
            case pinTFTwo:
                
                self.pinTFOne.becomeFirstResponder()
                break
                
            case pinTFOne:
                
                self.pinTFOne.resignFirstResponder()
                break
                
            default:
                
                break
                
            }
            
        }
        
    }

    
    @IBAction func getInBtnAction(_ sender: Any) {
   
      validateAndLogin()
        
    }
    
    
    func validateAndLogin() {
        
        let confirmPIN = pinTFOne.text!+pinTFTwo.text!+pinTFThree.text!+pinTFFour.text!
        
        let loginPIN = UserDefaults.standard.object(forKey: "PINforLogin")
        
        if confirmPIN.count < 4 {
            
            SingleToneClass.shared.showAlert(target: self, title: "Alert..!", message: "Please enter 4 digit PIN") {
                
                self.pinTFOne.text = ""
                self.pinTFTwo.text = ""
                self.pinTFThree.text = ""
                self.pinTFFour.text = ""
                
            }
            
        } else if confirmPIN != loginPIN as! String {
            
            SingleToneClass.shared.showAlert(target: self, title: "Alert..!", message: "Invalid PIN") {
                
                self.pinTFOne.text = ""
                self.pinTFTwo.text = ""
                self.pinTFThree.text = ""
                self.pinTFFour.text = ""
                
            }
            
        } else {
            
            let gotoAllAccounts = self.storyboard?.instantiateViewController(withIdentifier: "AllAccounts") as! AllAccounts
            self.navigationController?.pushViewController(gotoAllAccounts, animated: true);
            
        }
        
    }
    
    
}
