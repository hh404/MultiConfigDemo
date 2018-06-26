//
//  LocalDetailViewController.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/17.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit

class LocalDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "demo", withExtension: "json")
        do{
        let json = try String(contentsOf: url!)
        
        let label = UILabel()
            label.numberOfLines = 0
        label.text = json
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(60)
            }
            
        }
        catch{
            
        }
        
        self.title = "Local Target"
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
