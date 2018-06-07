//
//  AllAccounts.swift
//  iSecure
//
//  Created by Saikumar Pallagani on 19/04/18.
//  Copyright © 2018 Saikumar Pallagani. All rights reserved.
//

import UIKit

class AllAccounts: UIViewController {

    var addButton = UIBarButtonItem()
    var editButton = UIBarButtonItem()
    var trashButton = UIBarButtonItem()
    
    var editingAccounts : Bool = false
    
    @IBOutlet weak var accountsTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        SingleToneClass.shared.setUpNavigationController(target: self, hideNavigationController: false)
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAccount))
        addButton.tintColor = UIColor.white
        
        trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashAccount))
        trashButton.tintColor = UIColor.white
        
        
        self.navigationItem.setRightBarButton(addButton, animated: true)
        
        
        editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAccount))
        editButton.tintColor = UIColor.white
        self.navigationItem.setLeftBarButton(editButton, animated: true)
        
        accountsTable.allowsMultipleSelectionDuringEditing = true
        
        accountsTable.setEditing(false, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func addAccount() {
        
        let gotoAllAccounts = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccount") as! CreateAccount
        self.navigationController?.pushViewController(gotoAllAccounts, animated: true);
        
    }
    
    @objc func trashAccount() {
        
        
        
    }
    
    @objc func editAccount() {
        
        editingAccounts = !editingAccounts
        
        if editingAccounts {

            editButton.title = "Done"
            self.navigationItem.setRightBarButton(trashButton, animated: true)
            accountsTable.setEditing(true, animated: true)
            
        } else {
            
            editButton.title = "Edit"
            self.navigationItem.setRightBarButton(addButton, animated: true)
            accountsTable.setEditing(false, animated: true)
            
        }
        
    }
    

}


extension AllAccounts : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeAccountTVCell", for: indexPath) as! HomeAccountTVCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let gotoViewAccount = self.storyboard?.instantiateViewController(withIdentifier: "ShowAccount") as! ShowAccount
        self.navigationController?.pushViewController(gotoViewAccount, animated: true);
        
    }
    
}
