//
//  AddMemoViewController.swift
//  Memo
//
//  Created by 清本凌太 on 2018/12/22.
//  Copyright © 2018年 清本凌太. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save()  {
        
        let inputText = memoTextView.text
        
        let ud = UserDefaults.standard
        
        if ud.array(forKey: "memoArray") != nil {
            
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            
            if inputText != nil {
                saveMemoArray.append(inputText!)
            } else {
                print("何も入力されていません")
            }
            ud.set(saveMemoArray, forKey: "memoArray")
        } else {
            var newMemoArray = [String]()
            
            if inputText != nil {
                newMemoArray.append(inputText!)
            } else {
                print("何も入力されていない")
            }
            ud.set(newMemoArray, forKey: "memoArray")
        }
        ud.synchronize()
        self.dismiss(animated: true, completion: nil)
    }
    
}

