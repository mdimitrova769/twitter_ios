//
//  LoginViewController.swift
//  Twitter
//
//  Created by Mac mini on 16.02.21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLogedIn") == true {
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }

    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLogedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in!")
        })
        
    }

}
