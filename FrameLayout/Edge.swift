//
//  Edge.swift
//  FrameLayout
//
//  Created by chutatsu on 2019/05/02.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit

protocol EdgeProtocol {
    //    associatedtype Target
    var view: UIView { get }
    //    var target: Target { get }
    func getPosition() -> CGFloat
}

public struct HorizontalEdge: EdgeProtocol {
    enum Target {
        case left, right, centerX
    }
    var view: UIView
    private var target: Target
    init(view: UIView, target: Target) {
        self.view = view
        self.target = target
    }
    
    func getPosition() -> CGFloat {
        return view.frame.position(target: target)
    }
}

public struct VerticalEdge: EdgeProtocol {
    enum Target {
        case top, bottom, centerY
    }
    var view: UIView
    private var target: Target
    init(view: UIView, target: Target) {
        self.view = view
        self.target = target
    }
    
    func getPosition() -> CGFloat {
        return view.frame.position(target: target)
    }
}

extension CGRect {
    
    func position(target: HorizontalEdge.Target) -> CGFloat {
        switch target {
        case .left: return minX
        case .right: return maxX
        case .centerX: return midX
        }
    }
    
    func position(target: VerticalEdge.Target) -> CGFloat {
        switch target {
        case .top: return minY
        case .bottom: return maxY
        case .centerY: return midY
        }
    }
}
