//
//  ViewController.swift
//  Memo
//
//  Created by 清本凌太 on 2018/12/22.
//  Copyright © 2018年 清本凌太. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memoArray = [String]()
    
    @IBOutlet var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        memoTableView.dataSource = self
        memoTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        loadMemo()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell")!
        cell.textLabel?.text = memoArray[indexPath.row]
        return cell
    }
    
    func loadMemo()  {
        
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil {
            
            memoArray = ud.array(forKey: "memoArray") as! [String]
            memoTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            
            let detailViewController = segue.destination as! DetailViewController
            let selectedIndexPath = memoTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoArray[selectedIndexPath.row]
            detailViewController.selectedRow = selectedIndexPath.row
        }
        
    }
    
}


