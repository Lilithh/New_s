//
//  SideMenuViewController.swift
//  News
//
//  Created by wyh on 2017/11/29.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    var menuList: [SideMenuListContainer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let type = ["天大风情","书香校园", "体育日报", "用户推荐日报"]
        let id = ["2", "3", "4", "5"]
        for i in 0...3 {
            var model = SideMenuListContainer()
            model.type = type[i]
            model.id = id[i]
            menuList.append(model)
            
            self.tableView.reloadData()
        }
        
        self.tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        self.tableView.backgroundColor = .darkGray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 继承的 dataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "menuList")
        cell.textLabel?.text = self.menuList[indexPath.row].type
        cell.textLabel?.textColor = .lightGray
        cell.backgroundColor = .darkGray
        cell.accessoryType = UITableViewCellAccessoryType.detailButton
        return cell
    }
    
    //继承的delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushViewController = TypeNewsViewController()
        pushViewController.id = self.menuList[indexPath.row].id
        pushViewController.type = self.menuList[indexPath.row].type
        let nav2 = UINavigationController(rootViewController: pushViewController)
        self.present(nav2, animated: true, completion: nil)
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
