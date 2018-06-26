//
//  ViewController.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/16.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    var dataSource:ConfigDataSource?
    var delegate:ConfigDelegate?
    
    private static var currentConfig: String {
        #if Debug
            return ".Debug"
        #elseif Release
            return ".ReleaseTest"
        #else
            return ".Local"
        #endif
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "ConfigDemo"
        print(ViewController.currentConfig)
        self.initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initTableView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.registerClass()
        dataSource = ConfigDataSource()
        self.tableView.dataSource = dataSource
        dataSource?.initData()
        delegate = ConfigDelegate()
        delegate?.controller = self
        self.tableView.delegate = delegate
    }
    func registerClass() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

