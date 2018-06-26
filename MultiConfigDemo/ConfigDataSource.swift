//
//  ConfigDataSource.swift
//  MultiConfigDemo
//
//  Created by hans on 2018/6/17.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

//MARK:- Business Model

enum ConfigType {
    case debug
    case local
    case pilot
    case release
    case uat
}


//MARK:- UI Model

enum ConfigSection {
    case section(String,[ConfigItem])
}

enum ConfigItem {
    case normalItem(String)
    case indicatorItem(String,ConfigType)
}

class ConfigDataSource: NSObject {
    var sections:[ConfigSection] = []
    
    func initData()  {

        let localItem:ConfigItem = .indicatorItem("Local", .local)
        let uatItem:ConfigItem = .indicatorItem("UAT", .uat)
        let pilotItem:ConfigItem = .normalItem("Pilot")
        let releaseItem:ConfigItem = .normalItem("Release")
        let targetSection:ConfigSection = .section("Targets", [localItem,uatItem,pilotItem,releaseItem])
        sections.append(targetSection)

    }
}

//MARK:- UITableViewDelegate,UITableViewDataSource

extension ConfigDataSource:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionElment = sections[section]
        switch sectionElment {
        case .section( _, let items):
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let section = sections[indexPath.section]
        switch section {
        case .section(_, let items):
            let item = items[indexPath.row]
            switch item{
            case .indicatorItem(let title,_):
                cell.textLabel?.text = title
                cell.accessoryType = .disclosureIndicator
                break
            case .normalItem(let title):
                cell.textLabel?.text = title
                cell.accessoryType = .none
                break
            }
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        switch section {
        case .section(let title, _):
            return title
        }
    }
    
}

//extension ConfigSection{
//    var items:[ConfigItem] = {
//        switch self {
//        case .section(let items):
//
//             return items
//        }
//
//    }
//}


