//
//  ViewController.swift
//  GKCoverSwiftDemo
//
//  Created by QuintGao on 2017/4/28.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit
import GKCoverSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.backgroundColor = UIColor.green
        button.frame = CGRect(x: 100, y: 100, width: 80, height: 20)
        button.setTitle("显示弹窗", for: .normal)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonClick() {
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.gk_size = CGSize(width: kScreenW, height: 200)
        
        let cover = GKCover(fromView: view, contentView: v, style: .Translucent, showStyle: .Bottom, showAnimStyle: .Bottom, hideAnimStyle: .Bottom, notClick: false, showBlock: {
            print("遮罩显示了。。。。")
        }, hideBlock: {
            print("遮罩隐藏了。。。。")
        })
        
        cover.show()
    }
}

