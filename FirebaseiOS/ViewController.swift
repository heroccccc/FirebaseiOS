//
//  ViewController.swift
//  FirebaseiOS
//
//  Created by 高橋博司 on 2018/06/24.
//  Copyright © 2018年 takahashi. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //firebaseに追加するtext入力
    @IBOutlet weak var inputText: UITextField!
    
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //インスタンスを作成
        DBRef = Database.database().reference()
        
    }
    
    //sendボタンが押されたら
    @IBAction func sendFirebase(_ sender: Any) {
        
        //databaseにあげるデータ
        let data = ["name": inputText.text!]
        
        //databaseにあげるデータ更新
        DBRef.child("/").updateChildValues(data)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

