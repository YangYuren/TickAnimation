//
//  ViewController.swift
//  RightAnimationDemo
//
//  Created by Aeyanr on 2018/9/9.
//  Copyright © 2018年 Aeyanr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AnimationRightDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        
        let animTick = AnimationRightView(frame: CGRect(x: 100, y: 200, width: 50, height: 50), backColor: UIColor.green.withAlphaComponent(0.5), tickColor: UIColor.white)
        animTick.delegate = self
        view.addSubview(animTick)
        
        
        print("This a test")
    }
    
    //delegate
    func AnimationRightValueChange(view: AnimationRightView) {
        print("\(view.isTick)")
    }

}

