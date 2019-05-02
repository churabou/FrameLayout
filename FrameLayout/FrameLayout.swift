//
//  FrameLayout.swift
//  FrameLayout
//
//  Created by chutatsu on 2019/05/02.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit

public extension UIView {
    
    var fl: FrameLayout {
        return FrameLayout(view: self)
    }
    
    var edge: Edge {
        return Edge(view: self)
    }
}

public class FrameLayout {
    
    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    deinit {
        apply()
    }
    
    private var top: CGFloat?
    private var left: CGFloat?
    private var right: CGFloat?
    private var bottom: CGFloat?
    private var width: CGFloat?
    private var height: CGFloat?
    private var centerX: CGFloat?
    private var centerY: CGFloat?
    
    private func apply() {
        var newRect = view.frame
        
        //    func computeHorizontalPosition(_ newRect: CGRect)  {
        
        // left & right
        if let left = self.left, let right = self.right {
            newRect.origin.x = left
            newRect.size.width = right - left
        }
        
        // left & width
        if let left = self.left, let width = self.width {
            newRect.origin.x = left
            newRect.size.width = width
        }
        
        // right & width
        if let right = self.right, let width = self.width {
            newRect.origin.x = right - width
            newRect.size.width = width
        }
        
        // centerX & width
        if let centerX = self.centerX, let width = self.width {
            newRect.origin.x = centerX - width / 2
            newRect.size.width = width
        }
        //    }
        
        //    func computeVerticalPosition(_ newRect: CGRect) {
        
        // top & bottom
        if let top = self.top, let bottom = self.bottom {
            newRect.origin.y = top
            newRect.size.height = bottom - top
        }
        
        // top & height
        if let top = self.top, let height = self.height {
            newRect.origin.y = top
            newRect.size.height = height
        }
        
        // bottom & height
        if let bottom = self.bottom, let height = self.height {
            newRect.origin.y = bottom - height
            newRect.size.height = height
        }
        
        // centerY & height
        if let centerY = self.centerY, let height = self.height {
            newRect.origin.y = centerY - height / 2
            newRect.size.height = height
        }
        //    }
        view.frame = newRect
    }
    
    private func getPositon(edge: EdgeProtocol) -> CGFloat? {
        guard let superview = view.superview else {
            return nil
        }
        // targetView is superView || same hierarchy (has same superView)
        if superview == edge.view || superview == edge.view.superview {
            return edge.getPosition()
        }
        return nil
    }
}

// reletive layout horizontal
extension FrameLayout {
    
    @discardableResult
    public func left(to: HorizontalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let left = getPositon(edge: to) {
            self.left = left + offset
        }
        return self
    }
    
    @discardableResult
    public func right(to: HorizontalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let right = getPositon(edge: to) {
            self.right = right + offset
        }
        return self
    }
    
    @discardableResult
    public func centerX(to: HorizontalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let centerX = getPositon(edge: to) {
            self.centerX = centerX + offset
        }
        return self
    }
}

// reletive layout vertical
extension FrameLayout {
    
    @discardableResult
    public func top(to: VerticalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let top = getPositon(edge: to) {
            self.top = top + offset
        }
        return self
    }
    
    @discardableResult
    public func bottom(to: VerticalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let bottom = getPositon(edge: to) {
            self.bottom = bottom + offset
        }
        return self
    }
    
    @discardableResult
    public func centerY(to: VerticalEdge, offset: CGFloat = 0) -> FrameLayout {
        if let centerY = getPositon(edge: to) {
            self.centerY = centerY + offset
        }
        return self
    }
}


extension FrameLayout {
    
    @discardableResult
    public func top(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.top(to: superview.edge.top, offset: offset)
    }
    
    @discardableResult
    public func left(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.left(to: superview.edge.left, offset: offset)
    }
    
    @discardableResult
    public func right(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.right(to: superview.edge.right, offset: offset)
    }
    
    @discardableResult
    public func bottom(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.bottom(to: superview.edge.bottom, offset: offset)
    }
    
    @discardableResult
    public func centerX(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.centerX(to: superview.edge.centerX, offset: offset)
    }
    
    @discardableResult
    public func centerY(_ offset: CGFloat) -> FrameLayout {
        guard let superview = view.superview else {
            return self
        }
        return self.centerY(to: superview.edge.centerY, offset: offset)
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> FrameLayout {
        self.width = width
        return self
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> FrameLayout {
        self.height = height
        return self
    }
}


extension FrameLayout {
    
    @discardableResult
    public func size(_ size: CGFloat) -> FrameLayout {
        width(size)
        height(size)
        return self
    }
}



public struct Edge {
    
    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    public var left: HorizontalEdge {
        return HorizontalEdge(view: view, target: .left)
    }
    
    public var right: HorizontalEdge {
        return HorizontalEdge(view: view, target: .right)
    }
    
    public var centerX: HorizontalEdge {
        return HorizontalEdge(view: view, target: .centerX)
    }
    
    public var top: VerticalEdge {
        return VerticalEdge(view: view, target: .top)
    }
    
    public var bottom: VerticalEdge {
        return VerticalEdge(view: view, target: .bottom)
    }
    
    public var centerY: VerticalEdge {
        return VerticalEdge(view: view, target: .centerY)
    }
}
