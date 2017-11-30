//
//  ViewController.swift
//  News
//
//  Created by wyh on 2017/11/28.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit
import MJRefresh


class ViewController: UIViewController, ViewControllerDataRequest{
    
    var tableView = UITableView()
    var news = [NewsContainer]()
    var request = DataGet()
    var header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.backgroundColor = .white
        self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "myNews")
        //上面一行 注册复用cell池，不加报错
        tableView.delegate = self
        tableView.dataSource = self
        request.delegate = self
        request.requireData()
        self.navigationItem.title = "今日热闻"
        let aa = UIImage(named: "menu")
        self.addLeftBarButtonWithImage(aa!)
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(ViewController.downFresh))
        self.tableView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: #selector(ViewController.upFresh))
        self.view.addSubview(tableView)
    }
    
    //ViewControllerDataRequest 协议方法
    func transValue(news: [NewsContainer]) {
        self.news = news
        self.tableView.reloadData()
    }
    //MJRefresh 下拉刷新
    @objc func downFresh() {
         self.tableView.mj_header.beginRefreshing()
        request = DataGet()
        request.requireData()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

