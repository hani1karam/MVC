//
//  ViewController.swift
//  MVC
//
//  Created by Hany Karam on 12/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        let param = ["email":EmailTxt.text!,
                     "password":PasswordTxt.text!]
        showLoading()
        NetWorkManager.instance.API(method: .post, url: login,parameters:param) { (err, status, response:LoginModel?) in
            self.HideLoading()
            if response?.status == true {
                print(response ?? "")
                let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.Home)
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else {
                print(err ?? "")
            }
        }
    }
    
}

