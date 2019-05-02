//
//  ViewController.swift
//  Example
//
//  Created by chutatsu on 2019/05/02.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit
import FrameLayout

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = UIView()
        red.backgroundColor = .red
        view.addSubview(red)
        
        let orange = UIView()
        orange.backgroundColor = .orange
        view.addSubview(orange)
        
        let green = UIView()
        green.backgroundColor = .green
        view.addSubview(green)
        
        let blue = UIView()
        blue.backgroundColor = .blue
        view.addSubview(blue)
        
        orange.fl
            .width(40).bottom(-50)
            .top(100).left(to: view.edge.left)
        
        red.fl
            .top(to: orange.edge.bottom)
            .height(50)
            .width(20)
            .centerX(to: orange.edge.centerX)
        
        green.fl
            .left(to: red.edge.left, offset: 10)
            .right(to: red.edge.right)
            .centerY(to: orange.edge.centerY)
            .height(70)
        
        blue.fl
            .right(-30).width(100)
            .height(100).centerY(to: view.edge.centerY)
        
    }
}



