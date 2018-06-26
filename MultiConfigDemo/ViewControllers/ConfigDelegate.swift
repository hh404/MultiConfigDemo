//
//  ConfigDelegate.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/17.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class ConfigDelegate: NSObject {
    weak var controller:ViewController?
//    weak var datasource
}

extension ConfigDelegate:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datasource = controller?.dataSource
        let section:ConfigSection = (datasource?.sections[indexPath.section])!
        switch section {
        case .section(_, let items):
            let item:ConfigItem = items[indexPath.row]
            switch item{
            case .normalItem(_):
                break
            case .indicatorItem(_, let type):
                switch(type){
                case .debug: break
                    
                case .local:
                    #if LOCAL
                    let localVC = LocalDetailViewController()
                    self.controller?.navigationController?.pushViewController(localVC, animated: true)
                    #else
                        let alert = UIAlertController(title: "", message: "这是一个targetDemo,请选择LocalDemo Scheme", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                            
                        })
                        alert.addAction(okAction)
                        self.controller?.present(alert, animated: true, completion: {
                            
                        })
                    #endif
                    break
                case .pilot: break
                    
                case .release: break
                    
                case .uat:
                    #if UAT
                        let vc = UATDetailViewController()
                        self.controller?.navigationController?.pushViewController(vc, animated: true)
                    #else
                        let alert = UIAlertController(title: "", message: "这是一个configration Demo,请选择UAT Scheme", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                            
                        })
                        alert.addAction(okAction)
                        self.controller?.present(alert, animated: true, completion: {
                            
                        })
                    #endif
                    break
                    
                }
                break
            }
            break
        }

    }
}
