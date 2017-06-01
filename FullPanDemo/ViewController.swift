//
//  ViewController.swift
//  FullPanDemo
//
//  Created by Tiny on 2017/5/23.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView:UITableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("请先注册cell,再使用")
        }
        cell.textLabel?.text = "xxx"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let testVC = TYTestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }
}

