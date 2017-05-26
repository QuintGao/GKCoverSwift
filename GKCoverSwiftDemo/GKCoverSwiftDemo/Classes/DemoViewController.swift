//
//  DemoViewController.swift
//  GKCoverSwiftDemo
//
//  Created by QuintGao on 2017/5/2.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit
import GKCoverSwift

class DemoViewController: UIViewController {

    var centerCover : GKCover! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func top01(_ sender: Any) {
        let topImage = UIImage(named: "top1")
        let imageView = UIImageView(image: topImage)
        imageView.gk_size = CGSize(width: kScreenW, height: kScreenW * (topImage?.size.height)! / (topImage?.size.width)!)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        v.backgroundColor = UIColor.clear
        view.addSubview(v)
        
        let cover = GKCover(fromView: v, contentView: imageView, style: .Translucent, showStyle: .Top, showAnimStyle: .Top, hideAnimStyle: .Top, notClick: false, showBlock: { 
            
        }) { 
            v .removeFromSuperview()
        }
        cover.show()
    }
    
    @IBAction func top02(_ sender: Any) {
        let topImage = UIImage(named: "top1")
        let imageView = UIImageView(image: topImage)
        imageView.gk_size = CGSize(width: kScreenW, height: kScreenW * (topImage?.size.height)! / (topImage?.size.width)!)
        imageView.isUserInteractionEnabled = true
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        v.backgroundColor = UIColor.clear
        view.addSubview(v)
        
        let cover = GKCover(fromView: v, contentView: imageView, style: .Translucent, showStyle: .Top, showAnimStyle: .Top, hideAnimStyle: .None, notClick: false, showBlock: { 
            
        }) { 
            v.removeFromSuperview()
        }
        cover.show()
    }
    
    @IBAction func center01(_ sender: Any) {
        let centerImage = UIImage(named: "share2")
        let imgView = UIImageView(image: centerImage)
        imgView.gk_size = CGSize(width: 300, height: 340)
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgClick)))
        
        centerCover = GKCover(fromView: UIApplication.shared.keyWindow!, contentView: imgView, style: .Translucent, showStyle: .Center, showAnimStyle: .Top, hideAnimStyle: .Bottom, notClick: true, showBlock: { 
            
        }, hideBlock: { 
            
        })
        
        centerCover.show()
        
        if centerCover.hasCover() {
            print("遮罩已存在")
        }else {
            print("遮罩不存在")
        }
    }
    
    @IBAction func center02(_ sender: Any) {
        let centerImage = UIImage(named: "share2")
        let imgView = UIImageView(image: centerImage)
        imgView.gk_size = CGSize(width: 300, height: 340)
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgClick)))
        
        centerCover = GKCover(fromView: UIApplication.shared.keyWindow!, contentView: imgView, style: .Translucent, showStyle: .Center, showAnimStyle: .Bottom, hideAnimStyle: .Top, notClick: true, showBlock: {
            
        }, hideBlock: {
            
        })
        
        centerCover.show()
        
        if centerCover.hasCover() {
            print("遮罩已存在")
        }else {
            print("遮罩不存在")
        }
    }
    
    @IBAction func center03(_ sender: Any) {
        let centerImage = UIImage(named: "share2")
        let imgView = UIImageView(image: centerImage)
        imgView.gk_size = CGSize(width: 300, height: 340)
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgClick)))
        
        centerCover = GKCover(fromView: UIApplication.shared.keyWindow!, contentView: imgView, style: .Translucent, showStyle: .Center, showAnimStyle: .Center, hideAnimStyle: .Center, notClick: true, showBlock: {
            
        }, hideBlock: {
            
        })
        
        centerCover.show()
        
        if centerCover.hasCover() {
            print("遮罩已存在")
        }else {
            print("遮罩不存在")
        }
    }
    
    @IBAction func center04(_ sender: Any) {
        let centerImage = UIImage(named: "share2")
        let imgView = UIImageView(image: centerImage)
        imgView.gk_size = CGSize(width: 300, height: 340)
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgClick)))
        
        centerCover = GKCover(fromView: UIApplication.shared.keyWindow!, contentView: imgView, style: .Translucent, showStyle: .Center, showAnimStyle: .Bottom, hideAnimStyle: .None, notClick: true, showBlock: {
            
        }, hideBlock: {
            
        })
        
        centerCover.show()
        
        if centerCover.hasCover() {
            print("遮罩已存在")
        }else {
            print("遮罩不存在")
        }
    }
    
    @IBAction func buttom01(_ sender: Any) {
        let bottomImage = UIImage(named: "share1")
        let imgView = UIImageView(image: bottomImage)
        imgView.gk_size = CGSize(width: kScreenW, height: kScreenW * (bottomImage?.size.height)! / (bottomImage?.size.width)!)
        
        let cover = GKCover(fromView: view, contentView: imgView, style: .Blur, showStyle: .Bottom, showAnimStyle: .Bottom, hideAnimStyle: .Bottom, notClick: false, showBlock: {}) {}
        cover.show()
    }
    
    @IBAction func bottom02(_ sender: Any) {
        let bottomImage = UIImage(named: "share1")
        let imgView = UIImageView(image: bottomImage)
        imgView.gk_size = CGSize(width: kScreenW, height: kScreenW * (bottomImage?.size.height)! / (bottomImage?.size.width)!)
        
        let cover = GKCover(fromView: view, contentView: imgView, style: .Blur, showStyle: .Bottom, showAnimStyle: .Bottom, hideAnimStyle: .None, notClick: false, showBlock:{}, hideBlock:{})
        cover.show()
    }
    
    
    func imgClick() {
        centerCover.hide()
        
        if centerCover.hasCover() {
            print("遮罩已存在")
        }else {
            print("遮罩不存在")
        }
    }
}
