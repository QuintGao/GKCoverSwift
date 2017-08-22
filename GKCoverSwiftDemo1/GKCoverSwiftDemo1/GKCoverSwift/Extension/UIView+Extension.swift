//
//  UIView+Extension.swift
//  GKCover-Swift
//
//  Created by QuintGao on 2017/4/26.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit

extension UIView {
    public var gk_x : CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var f = self.frame
            f.origin.x = newValue
            self.frame = f
        }
    }
    
    public var gk_y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var f = self.frame
            f.origin.y = newValue
            self.frame = f
        }
    }
    
    public var gk_width : CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var f = self.frame
            f.size.width = newValue
            self.frame = f
        }
    }
    
    public var gk_height : CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var f = self.frame
            f.size.height = newValue
            self.frame = f
        }
    }
    
    public var gk_right : CGFloat {
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            var f = self.frame
            f.origin.x = newValue - f.size.width
            self.frame = f
        }
    }
    
    public var gk_bottom : CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var f = self.frame
            f.origin.y = newValue - f.size.height
            self.frame = f
        }
    }
    
    public var gk_centerX : CGFloat {
        get{
            return self.center.x
        }
        set{
            var c = self.center
            c.x = newValue
            self.center = c
        }
    }
    
    public var gk_centerY : CGFloat {
        get{
            return self.center.y
        }
        set{
            var c = self.center
            c.y = newValue
            self.center = c
        }
    }
    
    public var gk_size : CGSize {
        get{
            return self.frame.size
        }
        set{
            var f = self.frame
            f.size = newValue
            self.frame = f
        }
    }
}
