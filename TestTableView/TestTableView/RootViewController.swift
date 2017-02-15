
//
//  RootViewController.swift
//  TestTableView
//
//  Created by 李芮 on 17/2/15.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    var items = ["武汉","上海","北京","深圳","广州","海口","重庆","成都","西安"]
    var leftButton: UIButton?
    var rightBarButtonItem:UIBarButtonItem?
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        initView()
        setupLeftButton()
        setupRightBarButtonItem()
       
    }
    //MARK:- Private Method
    func initView() {
        self.tableView = UITableView(frame: self.view.frame, style: .Grouped)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(self.tableView!)
    }
    
    func setupLeftButton() {
        self.leftButton = UIButton(type: .Custom)
        self.leftButton?.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        self.leftButton?.setTitle("Edit", forState: UIControlState.Normal)
        self.leftButton?.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.leftButton?.tag = 100
        self.leftButton?.addTarget(self, action: #selector(leftBarButtonItemClicked), forControlEvents: .TouchUpInside)
        
        let barButtonItem  = UIBarButtonItem(customView: self.leftButton!)
        self.navigationItem.leftBarButtonItem = barButtonItem
        
    }
    
    func leftBarButtonItemClicked() {
        print("leftBarButton")
        if self.leftButton?.tag == 100 {
            self.tableView?.setEditing(true, animated: true)
            self.leftButton?.tag = 200
            self.leftButton?.setTitle("Done", forState: .Normal)
            //右边按钮设置为不可用
            self.rightBarButtonItem?.enabled = false
        } else {
            //右边按钮设置为可用
            self.rightBarButtonItem?.enabled = true
            self.tableView?.setEditing(false, animated: true)
            self.leftButton?.tag = 100
            self.leftButton?.setTitle("Edit", forState: .Normal)
        }
    }
    
    func setupRightBarButtonItem() {
        self.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: #selector(rightBarButtonItemClicked))
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
    }
    
    func rightBarButtonItemClicked() {
        let row = self.items.count
        let  indexPath = NSIndexPath(forRow: row, inSection: 0)
        self.items.append("杭州")
        
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        
    }
    
    //MARK:- Tableview DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon")
        cell.tag = indexPath.row
        return cell;
    }
    //MARK:- Tableview Delegate
    //删除一行
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.items.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        print("删除\(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        if sourceIndexPath != destinationIndexPath {
            let item = items.removeAtIndex(sourceIndexPath.row)
//            if destinationIndexPath.row > items.count {
//                items.append(item)
//            } else {
                items.insert(item, atIndex: destinationIndexPath.row)
//            }

        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alertVC = UIAlertView(title: "提示", message: "你选择的是：\(items[indexPath.row])", delegate: nil, cancelButtonTitle: "OK")
        alertVC.show()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    
    
    
    
    
    
    
}