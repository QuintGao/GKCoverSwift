//
//  GKCoverEnum.swift
//  GKCover-Swift
//
//  Created by QuintGao on 2017/4/26.
//  Copyright © 2017年 高坤. All rights reserved.
//

import UIKit

/// 屏幕宽高
public let kScreenW = UIScreen.main.bounds.size.width
public let kScreenH = UIScreen.main.bounds.size.height

/// 默认动画时间
let kAnimDuration = 0.25

/// 默认透明度
let kAlpha = 0.5

// MARK - 枚举
public enum GKCoverStyle : Int {
    case Translucent  // 半透明
    case Transparent  // 全透明
    case Blur         // 高斯模糊
}

public enum GKCoverShowStyle : Int {
    case Top          // 显示在上面
    case Center       // 显示在中间
    case Bottom       // 显示在底部
}

public enum GKCoverShowAnimStyle : Int {
    case Top          // 从上弹出
    case Center       // 中间弹出
    case Bottom       // 底部弹出
    case None         // 无动画
}

public enum GKCoverHideAnimStyle : Int {
    case Top          // 从上隐藏
    case Center       // 中间隐藏（直接消失）
    case Bottom       // 底部隐藏
    case None         // 无动画
}













