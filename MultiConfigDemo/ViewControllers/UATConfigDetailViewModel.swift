//
//  ConfigViewModel.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/17.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import Alamofire

typealias requestSuccess = (_ model:String) -> Void

class UATConfigDetailViewModel: NSObject {

    func requestData(_ success:@escaping requestSuccess)  {
        Alamofire.request("http://7xo4qz.com1.z0.glb.clouddn.com/demoQiNiu.json").response { response in // method defaults to `.get`
            let str = String(data: response.data!, encoding: String.Encoding.utf8)
            debugPrint(response)
            success(str!)

        }
    }
}
