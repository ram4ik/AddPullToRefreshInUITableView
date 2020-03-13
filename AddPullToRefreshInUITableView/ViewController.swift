//
//  ViewController.swift
//  AddPullToRefreshInUITableView
//
//  Created by ramil on 13.03.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var refreshControll = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.refreshControll.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        self.refreshControll.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        self.myTableView.addSubview(refreshControll)
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        print("Table is pulling to refresh")
    }
    
    var dataStore = ["Mobile Development", "Web Design", "UI/UX", "Python"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let foodElement = dataStore[indexPath.row]
        
        cell.textLabel?.text = foodElement
        
        return cell
    }
}

