//
//  NewsDetailViewController.swift
//  News
//
//  Created by wyh on 2017/11/29.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsDetailViewController: UIViewController {
    var webView = UIWebView(frame: UIScreen.main.bounds)
    var url = "https://open.twtstudio.com/api/v1/news/"
    var index: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(url + index)
        loadRequest(url: (url + index))
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRequest(url: String) {
        Alamofire.request(url).responseJSON() { response in
            if response.result.isSuccess {
                if let json = response.result.value {
                    let Json = JSON(json)
                    let content = Json["data"]["content"].string
                    self.webView.loadHTMLString(content!, baseURL: NSURL(string: url)! as URL)
                }
            }
        }
        
//        self.webView.loadRequest(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)     //这个方法用下面这一组数据
        //     var url = "http://daily.zhihu.com/story/"
        //    var indexx = "9659041"
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
