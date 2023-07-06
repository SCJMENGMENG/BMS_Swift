//
//  BaseNavigationController.swift
//  BMS_Swift
//
//  Created by MAC on 14.6.23.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.interactivePopGestureRecognizer?.delegate = self
        
        self .setTabBarLine()
    }
    
    func setTabBarLine() {
        let bottomLineView = UIView(frame: CGRect(x: 0, y: self.navigationBar.frame.size.height - 1, width: self.navigationBar.frame.size.width, height: 1))
        bottomLineView.backgroundColor = UIColor.hexString("#ECEFF5", alpha: 0.8)
        self.navigationBar.addSubview(bottomLineView)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count <= 1 {
            return false
        }
        return true
    }

}
