//
//  DataGet.swift
//  News
//
//  Created by wyh on 2017/11/29.
//  Copyright © 2017年 wyh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
// ViewController dataProvide
class DataGet {
    var news: [NewsContainer] = []
    var delegate: ViewControllerDataRequest?
    let url = "http://open.twtstudio.com/api/v1/news/1/page/1"
    func requireData() {
        var model = NewsContainer()
        Alamofire.request("http://open.twtstudio.com/api/v1/news/1/page/1").responseJSON() { response in
            if response.result.isSuccess {           //不加这个 会导致不会向下运行
                if let json = response.result.value {
                //解析 json
                let Json = JSON(json)
                //拿出来 data 的数据字典
                let dataDict = Json["data"]
                for i in 0..<dataDict.count {
                    model.index = dataDict[i]["index"].string ?? "index empty"
                    model.pic = dataDict[i]["pic"].string ?? "http://google.com/favicon.ico"
                    model.subject = dataDict[i]["subject"].string ?? "subject empty"
                    self.news.append(model)
                    }
                    self.delegate?.transValue(news: self.news)
                }
            }
        }
    }
}

// ViewController dataProvide protocol
protocol ViewControllerDataRequest {
    func transValue(news: [NewsContainer])
}


//slideMenu dataProvide

class SlideMenuDataGet {
    var news: [NewsContainer] = []
    var delegate: SideMenuDataRequest?
    func requireData(id: String) {
        Alamofire.request("http://open.twtstudio.com/api/v1/news/\(id)/page/1").responseJSON() { response in
            if response.result.isSuccess {
                if let json = response.result.value {
                    let Json = JSON(json)
                    let dataDict = Json["data"]
                    for i in 0..<dataDict.count {
                        var model = NewsContainer()
                        model.index = dataDict[i]["index"].string
                        model.subject = dataDict[i]["subject"].string
                        model.pic = dataDict[i]["pic"].string
                        self.news.append(model)
                    }
                    self.delegate?.transValue(news: self.news)
                }
            }
        }
    }
}
//slideMenw dataprovide protocol
protocol SideMenuDataRequest {
    func transValue(news: [NewsContainer])
}





