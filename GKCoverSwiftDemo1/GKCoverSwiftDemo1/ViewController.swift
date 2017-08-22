//
//  ViewController.swift
//  GKCoverSwiftDemo1
//
//  Created by QuintGao on 2017/8/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        redView.backgroundColor = UIColor.red
        
        
        let cover = GKCover(contentView: redView, style: .Translucent, showStyle: .Bottom, showAnimStyle: .Bottom, hideAnimStyle: .Bottom, notClick: false)
        kAlpha = 1.0
        
        cover.show()
    }
}

