//
//  TypeNewsViewController.swift
//  News
//
//  Created by wyh on 2017/11/30.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit
import MJRefresh

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
        tableView.delegate = self
        tableView.dataSource = self
        request.delegate = self
        request.requireData(id: self.id)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回🔙", style: .plain, target: self, action: #selector(TypeNewsViewController.back))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: " + ", style: .plain, target: self, action: nil)

        self.navigationItem.title = type
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(ViewController.downFresh))
        self.tableView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: #selector(ViewController.upFresh))
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
    
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    //MJRefresh 下拉刷新
    @objc func downFresh() {
        self.tableView.mj_header.beginRefreshing()
        request = SlideMenuDataGet()
        request.requireData(id: self.id)
        //    request.delegate = self
        self.tableView.reloadData()
        self.tableView.mj_header.endRefreshing()
    }
    //MJRefresh 上拉加载
    @objc func upFresh(){
        self.tableView.mj_footer.beginRefreshing()
        self.tableView.reloadData()
        self.tableView.mj_footer.endRefreshing()
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
