//
//  TypeNewsViewController.swift
//  News
//
//  Created by wyh on 2017/11/30.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit

class TypeNewsViewController: UIViewController, SideMenuDataRequest {
    var news: [NewsContainer] = []
    var tableView = UITableView()
    var request = SlideMenuDataGet()
    var id: String!
    var type: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.backgroundColor = .white
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "mySideMenu")
//        tableView.delegate = self
//        tableView.dataSource = self
        request.delegate = self
        request.requireData(id: self.id)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回🔙", style: .plain, target: self, action: Selector(("back")))
        self.navigationItem.title = type
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transValue(news: [NewsContainer]) {
        self.news = news
        self.tableView.reloadData()
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
