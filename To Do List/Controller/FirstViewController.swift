//
//  FirstViewController.swift
//  To Do List
//
//  Created by К.К. on 19.09.18.
//  Copyright © 2018 TeamK. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias itemsType = Array<String>
    var items:itemsType = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prototypeCell = UITableViewCell(style: UITableViewCell.CellStyle.default
            , reuseIdentifier: "CellRI")
            
        prototypeCell.textLabel?.text = self.items[indexPath.row]
        
        return prototypeCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemsArray = UserDefaults.standard.object(forKey: "items") as? Array<String>
            if let items = itemsArray {
                self.items = items
            }
            items.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
       }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsArray = UserDefaults.standard.object(forKey: "items") as? Array<String>
        if let items = itemsArray {
            self.items = items
        }
        
        self.tableView.reloadData()
    }


}

