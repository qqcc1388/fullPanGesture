//
//  TYTestViewController.swift
//  FullPanDemo
//
//  Created by Tiny on 2017/5/23.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

import UIKit

class TYTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "内容"
        view.backgroundColor = .blue
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        super.viewDidDisappear(animated)
    }

}
