//
//  GetStarted.swift
//  iSecure
//
//  Created by Saikumar Pallagani on 19/04/18.
//  Copyright © 2018 Saikumar Pallagani. All rights reserved.
//

import UIKit

class GetStarted: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
    
        SingleToneClass.shared.setUpNavigationController(target: self, hideNavigationController: true)
        
        let haveAccount = UserDefaults.standard.bool(forKey: "IsPINGenerated");
        
        if haveAccount {
            
            let gotoLogin = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! Login
            self.navigationController?.pushViewController(gotoLogin, animated: true);
            
        } else {
            
            let gotoGeneratePIN = self.storyboard?.instantiateViewController(withIdentifier: "Generate") as! Generate
            self.navigationController?.pushViewController(gotoGeneratePIN, animated: true);
            
        }
        
    }
    

}
