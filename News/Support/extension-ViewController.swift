//
//  extension-ViewController.swift
//  News
//
//  Created by wyh on 2017/11/29.
//  Copyright © 2017年 wyh. All rights reserved.
//
import UIKit
import SDWebImage
import Foundation

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pieceNews = self.news[indexPath.row]
        let identifier = "myNews"
        
        // 创建一个cell
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NewsTableViewCell
        // cell 为空时创建cell
        if cell == nil {
            cell = NewsTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        //初始化cell要显示的内容
        cell?.initTilte(title: pieceNews.subject)
   //     cell.picture  异步加载图片
        cell?.picture.sd_setImage(with: URL.init(string: pieceNews.pic), completed: nil)

        
        return cell!
    }
    
    //delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/6
    }
    
}
