//
//  ViewController.swift
//  ComuComu
//
//  Created by 高野翔 on 2018/12/22.
//  Copyright © 2018 高野翔. All rights reserved.
//
// 【UserDefaults管理】"Initial"= 一番最初にアプリを開いた際の判定
// 【UserDefaults管理】"EULACheckFlag"= プライバシーポリシー・利用規約のページをきちんと開いた事を確認するFlag
// 【UserDefaults管理】"EULAagreement"= 利用規約に同意したかどうかの判定


import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    

    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var contactedButton: UIButton!
    
    //user defaultsを使う準備
    let userDefaults:UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userDefaultsの初期値設定
        userDefaults.register(defaults: ["Initial" : "NO", "EULAagreement" : "NO", "EULACheckFlag" : "NO"])
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let initial = userDefaults.string(forKey: "Initial")
        userDefaults.synchronize()
        
        // currentUserがnil(ログインしていない)場合
        if Auth.auth().currentUser == nil {
            
            if initial == "YES" {
                // Login画面へ遷移
                let login = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(login!, animated: false, completion: nil)
            }
            else {
                // Initial画面へ遷移
                let initial = self.storyboard?.instantiateViewController(withIdentifier: "Initial")
                self.present(initial!, animated: false, completion: nil)
            }
        }
    }
    
    
    @IBAction func shopButton(_ sender: Any) {
    }
    
    
    @IBAction func postButton(_ sender: Any) {
    }
    
    
    @IBAction func contactedButton(_ sender: Any) {
    }
    
}

