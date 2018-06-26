//
//  UATDetailViewController.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/17.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UATDetailViewController: UIViewController,NVActivityIndicatorViewable {
    var viewModel:UATConfigDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
        let label = UILabel()
        label.numberOfLines = 0
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(60)
        }
    
        viewModel = UATConfigDetailViewModel()
        self.startAnimating()
        viewModel?.requestData({ (model) in
            label.text = model
            self.stopAnimating()
        })
        
        self.title = "UAT Configration"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
