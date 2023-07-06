//
//  BaseViewController.swift
//  BMS_Swift
//
//  Created by MAC on 14.6.23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    
    //次级页面隐藏底部Tabbar
    func customNavigationMethod (nextVC: BaseViewController) {
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension BaseViewController {
    func getRandomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 1.0)
    }
}
