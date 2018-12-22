//
//  DetailViewController.swift
//  Memo
//
//  Created by 清本凌太 on 2018/12/22.
//  Copyright © 2018年 清本凌太. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedRow: Int!
    
    var selectedMemo: String!
    
    @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo
    }
    
    
    @IBAction func deleteMemo() {
        
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil {
            
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray")
            ud.synchronize()
        }
    }
    
}
