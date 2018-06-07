//
//  SingleToneClass.swift
//  iSecure
//
//  Created by Saikumar Pallagani on 19/04/18.
//  Copyright © 2018 Saikumar Pallagani. All rights reserved.
//

import UIKit

class SingleToneClass: NSObject {

    private override init() { }
    
    static let shared = SingleToneClass()
    
    
    public func setUpNavigationController (target : UIViewController, hideNavigationController : Bool, navigationBarTint : UIColor, navigationTintColor : UIColor ) {
        
        if let navigationController = target.navigationController {
            
            if hideNavigationController {
                
                navigationController.navigationBar.isHidden = true
                
            } else {
                
                navigationController.navigationBar.barTintColor = navigationBarTint
                navigationController.navigationBar.tintColor = navigationTintColor
                
            }
            
        }
        
    }
    
    public func setUpNavigationController ( target : UIViewController, hideNavigationController : Bool) {
        
      
        if let navigationController = target.navigationController {
            
            if hideNavigationController {
                
                navigationController.navigationBar.isHidden = true
                
            } else {
                
                navigationController.navigationBar.isHidden = false
                
            }
            
        }
        
    }
    
    
    public func showAlert(target : UIViewController, title : String, message : String, onOkAction : @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (okAction) in
            
            onOkAction()
            
        }))
        
        target.present(alert, animated: true, completion: nil)
        
    }
    
    
}
