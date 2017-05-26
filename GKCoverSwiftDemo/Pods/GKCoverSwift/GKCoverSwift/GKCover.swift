//
//  GKCover.swift
//  GKCover-Swift
//
//  Created by QuintGao on 2017/4/26.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit

public class GKCover: UIView, CAAnimationDelegate {

    var coverShow     : Bool = false
    var animated      : Bool = false
    var notclick      : Bool = false
    
    var fromView      : UIView!
    var contentView   : UIView!
    var style         : GKCoverStyle!
    var showStyle     : GKCoverShowStyle!
    var showAnimStyle : GKCoverShowAnimStyle!
    var hideAnimStyle : GKCoverHideAnimStyle!
    var showBlock     : (() -> Swift.Void)? = nil
    var hideBlock     : (() -> Swift.Void)? = nil
    
    
    // MARK: - Public Method
    // 显示遮罩
    public func show() {
        
        fromView.addSubview(self)
        
        switch style! {
        case .Translucent:
            setupTranslucentCover()
            break
        case .Transparent:
            setupTransparentCover()
            break
        case .Blur:
            setupBlurCover()
            break
        }
        
        showCover()
    }
    
    // 隐藏遮罩
    public func hide() {
        hideCover()
    }
    
    // 是否有遮罩
    public func hasCover() -> Bool {
        return self.coverShow
    }
    
    // MARK: - Private Method
    
    private func animationAlert(view : UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 0.5
        animation.delegate = self
        
        var values = [Any]()
        
        values.append(CATransform3DMakeScale(0.1, 0.1, 1.0))
        values.append(CATransform3DMakeScale(1.2, 1.2, 1.0))
        values.append(CATransform3DMakeScale(0.9, 0.9, 1.0))
        values.append(CATransform3DMakeScale(1.0, 1.0, 1.0))
        
        animation.values = values
        
        view.layer.add(animation, forKey: nil)
    }
    
    // delegate
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        showBlock!()
    }
    
    /// 半透明遮罩
    ///
    /// - Parameter cover: 遮罩
    private func setupTranslucentCover() {
        coverAddTap(cover: self)
        backgroundColor = UIColor.black
        alpha = CGFloat(kAlpha)
    }
    
    /// 全透明遮罩
    ///
    /// - Parameter cover: 遮罩
    private func setupTransparentCover() {
        backgroundColor = UIColor.clear
        addSubview(getTransparentBgView())
    }
    
    /// 高斯模糊遮罩
    ///
    /// - Parameter cover: 遮罩
    private func setupBlurCover() {
        backgroundColor = UIColor.clear
        coverAddTap(cover: self)
        // 添加高斯模糊效果
        let blur = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.frame = bounds
        
        addSubview(effectView)
    }
    
    // 获取透明遮罩
    private func getTransparentBgView() -> UIView {
        let bgView = UIImageView()
        bgView.gk_size = gk_size
        bgView.image = UIImage(named: "transparent_bg")
        bgView.isUserInteractionEnabled = true
        coverAddTap(cover: bgView)
        return bgView
    }
    
    /// 遮罩添加手势
    ///
    /// - Parameter cover: 遮罩
    private func coverAddTap(cover: UIView) {
        if notclick == false {
            cover.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideCover)))
        }
    }
    
    private func showCover() {
        self.coverShow = true
        
        fromView.addSubview(contentView)
        contentView.gk_centerX = fromView.gk_centerX
        
        switch showStyle! {
        case .Top:  // 显示在顶部
            if showAnimStyle == .Top {
                contentView.gk_y = -contentView.gk_height
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView.gk_y = 0
                }, completion: { (finished) in
                    self.showBlock!()
                })
            }else {
                if showBlock != nil {
                    
                }
                
                contentView.gk_y = 0
            }
            break
        case .Center:  // 显示在中间
            if showAnimStyle == .Top {
                contentView.gk_y = -contentView.gk_height
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView.center = self.fromView.center
                }, completion: { (finished) in
                    self.showBlock!()
                })
            }else if showAnimStyle == .Center {
                contentView!.center = fromView.center
                animationAlert(view: contentView)
            }else if showAnimStyle == .Bottom {
                contentView.gk_y = kScreenH
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView.center = self.fromView.center
                }, completion: { (finished) in
                    if self.showBlock != nil {
                        self.showBlock!()
                    }
                })
            }else {
                contentView.center = fromView.center
                if showBlock != nil {
                    showBlock!()
                }
            }
            break
        case .Bottom:
            if showAnimStyle == .Bottom {
                contentView.gk_y = kScreenH
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView.gk_y = kScreenH - self.contentView.gk_height
                }, completion: { (finished) in
                    if self.showBlock != nil {
                        self.showBlock!()
                    }
                })
            }else {
                if showBlock != nil {
                    showBlock!()
                }
                contentView.gk_y = kScreenH - contentView.gk_height
            }
            break
        }
    }
    
    @objc private func hideCover() {
        // 这里为了防止动画未完成，导致的不能及时判断cover是否存在，实际上cover再这里并没有被销毁
        self.coverShow = false
        
        switch showStyle! {
        case .Top:
            if hideAnimStyle! == .Top {
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView?.gk_y = -(self.contentView?.gk_height)!
                }, completion: { (finished) in
                    self.remove()
                })
            }else {
                contentView?.gk_y = -(contentView?.gk_height)!
                remove()
            }
            break
        case .Center:
            if hideAnimStyle! == .Top {
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView?.gk_y = -(self.contentView?.gk_height)!
                }, completion: { (finished) in
                    self.remove()
                })
            }else if hideAnimStyle! == .Center {
                remove()
            }else if hideAnimStyle! == .Bottom {
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView?.gk_y = kScreenH
                }, completion: { (finished) in
                    self.remove()
                })
            }else {
                contentView?.center = (fromView?.center)!
                remove()
            }
            break
        case .Bottom:
            if hideAnimStyle! == .Bottom {
                UIView.animate(withDuration: kAnimDuration, animations: { 
                    self.contentView?.gk_y = kScreenH
                }, completion: { (finished) in
                    self.remove()
                })
            }else{
                contentView?.gk_y = kScreenH
                remove()
            }
            break
        }
    }
    
    private func remove() {
        removeFromSuperview()
        contentView?.removeFromSuperview()
        
        if (hideBlock != nil) {
            hideBlock!()
        }
        
        contentView = nil
    }
}

extension GKCover {
    
   public convenience init(fromView: UIView, contentView: UIView, style: GKCoverStyle, showStyle: GKCoverShowStyle, showAnimStyle: GKCoverShowAnimStyle, hideAnimStyle: GKCoverHideAnimStyle, notClick: Bool, showBlock: (() -> Swift.Void)? = nil, hideBlock: (() -> Swift.Void)? = nil) {
        
        self.init(frame: fromView.bounds)
        
        self.style          = style
        self.showStyle      = showStyle
        self.showAnimStyle  = showAnimStyle
        self.hideAnimStyle  = hideAnimStyle
        self.fromView       = fromView
        self.contentView    = contentView
        self.notclick       = notClick
        self.showBlock      = showBlock
        self.hideBlock      = hideBlock
    }
}
